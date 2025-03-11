---
title: "Object system: systems"
description: "Mach modules may contain systems: functions, or a list of systems (functions), that could be run if desired."
draft: false
layout: "docs"
docs_type: "docs"
rss_ignore: true
---

# Object system: systems

Mach systems are a key concept of [the Mach object system](../). Systems are functions, or a list of systems (functions), that could be run if desired.

## Declaring systems

To declare a system, one simply needs to add the name of the system to a `pub const mach_systems` list in the [module](../modules):

```zig
pub const mach_module = .foo;

// ...

pub const mach_systems = .{ .init, .tick, .deinit };
```

The names written in this list (`.init`, `.tick`, `.deinit`) can be whatever we like, since we're _declaring them_.

If a system is named in the `mach_systems` list, then there must also be a _public function_ or _public schedule_ of the same name in the module:

**public function**:

```zig
pub fn tick() void {
    // could do something interesting here!
}
```

**public schedule**:

```zig
pub const init = mach.schedule(.{
    .{ OtherModule, .init }, // run OtherModule's .init system first,
    .{ App, .start },        // then afterwards run App's .start system
});
```

Systems are ultimately just functions (or lists of functions) that _could_ be run if someone wants them to. They don't do anything by default.

## Injected arguments

Above, we wrote a `tick` system function which had no arguments - system functions actually have _injected_ arguments which means we can accept _any Mach module that exists in the whole program_ as an argument, and when Mach calls the function it will just provide it for you!

```zig
pub fn tick(app: *App, other_mod: mach.Mod(Other), other: *Other) void {
    // Access App modules' global state
    app.counter += 1;

    // Access Other modules' global state
    other.counter += 1;

    // Run Other module's system (covered more in the next section)
    other_mod.run(.tick);
}
```

This is really powerful because it means that if you suddenly find that one part of your large/complex codebase needs to access another module's state, or work with another module's objects, etc. then it can simply write that in its function signature and that's it! You don't have to go chase down all the call sites of that function and provide a new parameter - Mach handles it for you.

A consequence of this is that _only Mach can provide arguments to your system functions_ - you cannot pass arbitrary arguments. This is actually a feature to help you write more performant code, which we'll get into later in the [objects](../objects) section.

Note: you can always write functions that take arbitrary arguments in your Mach module - they just don't qualify as valid _systems_.

## Running systems

By default, systems don't run ever. They only run if someone tells Mach to run them. One way to do this is via the `mach.Mod(T).run()` function, like what we saw in the `main.zig` example in the [modules section](../modules):

```zig
pub fn main() !void {
    // ...

    // Pass control to our App.zig module.
    const app: mach.Mod(App) = mods.get(.app);
    app.run(.main);
}
```

As you can see, if we have a Mach module like our `App.zig` from earlier, then we can use the `mach.Mod(App).run` function to invoke a system called `.main`.

Since **systems are globally addressible** (every system of every module in the entire program is known), and since we know the system name `.main` at comptime in this case, this can boil down to a simple function call which can even be inlined! There are a few subtle differences from a function call though:

* Mach knows the name of the system AND the name of the function, and can _observe how long the function takes to run_ - super useful for debugging performance problems!
* Instead of you passing in the arguments, Mach looks at the function signature and injects whichever are needed!
* If the system isn't a function but rather a `mach.schedule` (list of systems to be ran), Mach runs each one-after-the-other sequentially and can observe each of them independently for debugging purposes!

## Callbacks

As mentioned above, `mach.Mod(App).run(.fooBar)` takes a system name `.fooBar` that is _comptime known_. Sometimes you don't know at compile time what other system you'd like to run.

For example, perhaps your module will handle GUI windows for the application, and you need the user of your module to be able to specify what system should run when it is time to render a new frame to the window. In that case your application might store _function IDs_:

```zig
pub const mach_module = .gui_windows;

// ...

on_render: ?mach.SystemID = null,

pub fn update(windows: *@This(), windows_mod: mach.Mod(@This())) void {
    // Call whatever function is set in on_render.
    windows_mod.call(windows.on_render.?);
}
```

Now your module doesn't have to be aware of what exact system should run when rendering a frame should happen, and instead the user of your module can register that callback:

```zig
pub const mach_module = .app;

pub const mach_systems = .{ .init, .render };

pub fn init(app_mod: mach.Mod(@This()), windows: *Windows) void {
    // When the windowing library wants to render a new frame, have it run our app's .render system
    windows.on_render = app_mod.id.render;
}

pub fn render() void {
    // ...
}
```

Note how our App module takes a `app_mod` parameter: Mach knows how to inject two parameter types:

* A Module struct `M` itself (like our `App` module)
  * Gives access to a module's global state for example.
* A `mach.Mod(M)` struct (like `mach.Mod(App)`) - typically called e.g. `<module>_mod` like `app_mod`
  * Gives access to a `app_mod.run(.foo)` method which can run that module's comptime-known systems.
  * Gives access to a `app_mod.call(system_id)` method which can run _any_ system from any module, given its ID.
  * Gives access to `app_mod.id` struct, which contains an system ID for _every system in that module_, e.g. `app_mod.id.init` and `app_mod.id.render` would both be valid since our `App` module has `pub const mach_systems = .{ .init, .render };`

## Systems should run _unconditionally_

Although you have the ability to call systems at runtime and comptime from within another system's execution, you generally should avoid running systems _conditionally_.

For example, let's say you have two systems - one which spawns monsters, and one which processes newly spawned monsters.

```zig
pub fn spawnMonsters(monsters: *Monsters) void {
    // Maybe spawn some monsters
    // run processMonsterUpdates
}

pub fn processNewMonsters(monsters: *Monsters) void {
    // If there are new monsters, process them.
}
```

what you should **never** do is this

```zig
pub fn spawnMonsters(monsters: *Monsters, monsters_mod: mach.Mod(Monsters)) void {
    for (monsters.amount_to_spawn) {
        // ...
    }

    // BAD!:
    if (monsters.amount_to_spawn > 0) monsters_mod.run(.processNewMonsters);

    // GOOD!:
    // monsters_mod.run(.processNewMonsters);
}
```

This code conditionally runs the `processNewMonsters` system only if `monsters.amount_to_spawn > 0` - at first this might make sense: If no new monsters were spawned, then why run `processNewMonsters`? But this is not good because /someone else/ may have spawned monster objects (a debugger, a GUI editor, a different module that recieves updates over a network, etc.) and they won't know to call `processNewMonsters` after doing so.

Instead, `processNewMonsters` should always be run and just written to return quickly if there are no new monsters to process for example.

At this point we should look at _objects_ - because objects are a key concept of the object system which plays into _why systems should run unconditionally_ as well as _why system functions cannot have arbitrary arguments_: **_modules communicate via objects!_**

## Continue reading: systems

[Object system: objects](../objects)
