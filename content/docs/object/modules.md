---
title: "Object system: modules"
description: "Mach modules are the 'building blocks' used to organize everything in Mach itself, as well as in your own application."
draft: false
layout: "docs"
docs_type: "docs"
rss_ignore: true
---

# Object system: modules

Mach modules are a key concept of [the Mach object system](../). Mach modules (not to be confused with Zig modules, although they are very similar) are the 'building blocks' used to organize everything in Mach itself, as well as in your own application. You can pick and choose which modules your program uses, import third-party libraries that provide modules, etc.

Examples of modules: a physics engine, a 2D sprite renderer, a text renderer, a scene manager, your application's main logic, etc.

## Program entrypoint

Normally, you might start writing an application by writing the bulk of your code inside your `main.zig` file's `pub fn main`.

In a Mach application, you may not write `main.zig` at all. Instead you may prefer to let Mach provide `main.zig` for you depending on the platform, so that it can provide a different version for desktop/mobile/etc that handles such differences.

If you were to write `main.zig` yourself, though, it would look something like this for a desktop app:

```zig
const std = @import("std");
const mach = @import("mach");

// The set of Mach modules our application may use.
const Modules = mach.Modules(.{
    mach.Core,
    @import("App.zig"),
    @import("Renderer.zig"),
});

pub fn main() !void {
    const allocator = std.heap.c_allocator;

    // Initialize the module system.
    var mods: Modules = undefined;
    try mods.init(allocator);

    // Pass control to our App.zig module.
    const app = mods.get(.app);
    app.run(.main);
}
```

Here you can see we declare a `Modules` type - the set of Mach modules that our application may use when it runs.

**_All Mach modules in a program are known once the program starts_**, you can't e.g. add/remove/disable modules at runtime - once you register them, they're always there ready to be used - the only question is whether you do use them or not.

If you look closely, none of our application logic is written in this `main.zig` file either: instead we write our application logic inside `App.zig` - our very own Mach module - and `pub fn main` simply passes control to that module.

## The simplest Mach module

Just like a Zig module, a Mach module is simply a struct - often written as just a Zig code file. For example, here's an `App.zig` module:

```zig
pub const mach_module = .app;
```

This module doesn't do anything - it's just has a name - which is the only required field for a Mach module.

## Modules have _names_

Modules follow certain conventions and requirements, the first one being that a module _must have a unique name_.

The `pub const mach_module = .foobar;` is an enum literal indicating the module's name (you can write any value on the right hand side, since you're _declaring_ the module's name.)

Here are some naming rules and guidelines to be aware of:

1. No two modules in a program can have the same name (enforced by a compiler error), which means **_all Mach modules in a program are globally addressible_**.
2. If writing a module that others may import/use in their own programs, you should prefix your module names with a unique identifier like your project name to prevent conflicts with the user's own application modules.
   * Example: Mach's builtin modules are prefixed with "mach_", e.g. `.mach_sprite_renderer` instead of `.sprite_renderer`
3. If writing a module just for your application/game's logic, you can safely assume all modules you import are prefixed - so you can use single-word names like `.app`, `.physics`, `.renderer`, etc. for yourself.

## Modules can have _global state_

Let's look at our `App.zig` module from earlier: since Zig code files are just structs (as if you wrote the contents of a file inside a `struct { ... }` block), we can write struct fields at the top level of our file.

For example, we can add a `timer` and `counter` field to our `App.zig` module:

```zig
pub const mach_module = .app;

timer: mach.time.Timer,
counter: u32,
```

There is only ever one _instance_ of a module in a program, so these are _effectively_ global variables. Writing these as _struct fields_ rather than literally as global `var`s means that **_Mach moduloe's global state fields are globally addressible_** (its possible to walk _all modules used in the program_, then walk over _all their state fields_, inspecting their data types, and reading/writing their values at runtime - which is super useful for debug tooling and more!)

## Modules can have _systems_

Similar to how we declared `pub const mach_module = .foo_name;`, a module can declare that it has _systems_ with specific names:

```zig
pub const mach_systems = .{ .main, .init, .tick, .deinit };
```

In this case, our module declared that it has systems called `.main`, `.init`, `.tick`, and `.deinit` - these are just made up names (we're _declaring them_) - we can name them whatever we like.

Systems are ultimately just functions (or lists of functions) that _could_ be run if someone wants them to. They don't do anything by default.

The only requirement is that if a system is named in `mach_systems`, there must be a corresponding public function or schedule of the same name (else you'll get a compiler error) - for example:

```zig
pub fn init() void {
    // ...
}
```

Systems are covered in more depth in [the systems section](../systems).

## Modules can have _objects_

Just like how we added the `timer` and `counter` fields above, it is possible to declare _lists of objects_ inside a module. For example, here's a list of `monsters` where each monster object can have a `health` and `damage` value:

```zig
monsters: mach.Objects(struct {
    health: f32,
    damage: f32,
}),
```

Objects are covered in more depth in [the objects section](../objects).

## Continue reading: systems

[Object system: systems](../systems)
