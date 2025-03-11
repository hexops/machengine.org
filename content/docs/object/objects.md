---
title: "Object system: objects"
description: "Mach objects represent everything from virtual objects like textures and shaders, to visual in-game objects and more!"
draft: false
layout: "docs"
docs_type: "docs"
rss_ignore: true
---

# Object system: objects

Mach objects are a key concept of [the Mach object system](../) and are used to represent everything from virtual objects like textures and shaders, to visual in-game objects and more! 

# Declaring objects

Objects are declared just like [a modules' global state fields](../modules#modules-can-have-_global-state_) - the only difference is the data type of the struct field. For example, here is a dynamically-sized list of monster objects where each monster can have `health` and `damage` values:

```zig
pub const mach_module = .app;

// ...

monsters: mach.Objects(struct {
    health: f32,
    damage: f32,
}),
```

A Mach module can declare as many lists of object as they like using different field names.

**Mach objects are fully addressible**, it's possible to walk over all the Mach modules in a program, reflect on which objects they have, what their data types are, create/destroy objects, inspect objects' values, etc. all at runtime - which is central to enabling debug/GUI tooling, usage from other programming languages, network-synchronized objects, objects serialized to disk, etc.

# Using objects

Lists of objects, like `monsters` in the example above, are automatically initialized and ready-to-use by Mach. This means you can work with objects like so:

```zig
pub fn init(app: *App) void {
    app.monsters.lock();
    defer app.monsters.unlock();

    // Create a new monster object
    const new_monster_id: mach.ObjectID = app.monsters.new(.{
        .health = 100,
        .damage = 10,
    });

    // Print the monsters' health
    const new_monster = app.monsters.get(new_monster_id);
    std.debug.print("monster health: {}\n", .{new_monster.health});

    // Give the monster 2x damage!
    new_monster.damage *= 2;
    app.monsters.set(new_monster_id, new_monster); // save the change
}
```

## Performance & philosophy

The first thing we should talk about is performance and memory optimization. `mach.Objects` isn't just a dynamic array of structs - it actually stores all of the fields of the object independently (struct-of-arrays, same as a `std.MultiArrayList(T)`), so internally it's _as if_ there were a list of `[]f32` for the `health` of all objects, and another list of `[]f32` for the `damage` of all objects.

This design decision helps reduce the memory overhead of storing many objects, by eliminating _padding_ between struct fields - which can _greatly_ improve CPU cache efficiency and overall application performance. For more details you can watch [Andrew Kelley's Practical DOD talk](https://vimeo.com/649009599) which teaches practical ways to apply _data-oriented design_.

A core design decision of Mach's object system is to encourage you to _write code that operates on many objects at once_. For example, instead of writing a function that manipulates a single object (like how a Java programmer might), we instead prefer to store all our objects in a big array, and write a function that operates over all of them all at once. This can _massively_ improve performance by improving the odds that objects are in CPU L1/L2/L3 caches, reducing function call overhead, and more.

**System functions in Mach are restricted from having arbitrary arguments** in part to encourage you to write functions that operate on _many objects at once_, and to write modules that _communicate through objects_. Rather than calling another module's functions to cause an effect, you should assume the module's functions will run in the future - and you just need to create/modify/update an object to create the desired effect.

## Object IDs

The first thing you might notice about the code snippet above is that when you create a new object, you get an _object ID_ back:

```zig
    const new_monster_id: mach.ObjectID = app.monsters.new(.{
        .health = 100,
        .damage = 10,
    });
```

Object IDs are just stable integer identifiers, containing _a ton of information_ in them:

* An array index that can be used to O(1) lookup the actual data / struct fields of the object.
* The generation (or 'version') of the object, enabling detecting use-after-object-delete in many (but not all) cases.
* Which module the object came from, allowing looking up type information about the object - or which module it came from - just from its ID.
* Which exact list of objects in a module the object came from, allowing looking up detailed type information or the object's name - which enables debugging and type safety when passing opaque IDs around.

## Memory allocation

Internally, a `mach.Objects()` list maintains _a recycling bin_ of objects: when a `.new()` object is requested, it looks in the recycling bin to see if we have an index in the array which was a previously `.delete()`ed object. This allows for rapidly creating/destroying massive quantities of objects with very little overhead.

Additionally, since Mach has insights into the object lists it has the opportunity to analyze the required memory allocation as you e.g. play through your game, save that information to disk and compile it into future builds of the game - to allocate just the right amount in the future ahead of time for even fewer runtime memory allocations and better performance.

## Synchronization and multi-threading

You may have noticed that we have this code around our usage of the `monsters` list:

```zig
    app.monsters.lock();
    defer app.monsters.unlock();
```

All `mach.Objects` have a read-write lock protecting them.

This enables multiple threads, each running independent Mach module system functions, to coordinate with one-another without data race conditions. For example, you may have some game logic which works on monsters, while having a background thread handling network packets to keep monsters across the network synchronized, while also having a debug editor for your game allowing you to edit monsters' values at any time - all being synchronized by this read-write lock.

Importantly, since all `mach.Objects` by convention have a read-write lock which should be held when working with them, it is possible to work with _arbitrary objects_ safely without knowing what they are or under what contract they can be manipulated. For example, a GUI editor can read or write arbitrary objects' values safely without knowing anything about that type of object - all at runtime.

**Performance note:** Since it is a read-write lock, multiple threads can read at once. Mutexes are cheap as long as there is no thread contention, and `mach.Objects` lists are designed to be generally large in size and performant in other ways - so this works out and keeps sometimes quite complex multi-threaded code simple to reason about.

## Iterating objects

A very common thing to do is iterate all objects, which you can do like so:

```zig
pub fn tick(app: *App) void {
    app.monsters.lock();
    defer app.monsters.unlock();

    // Iterate over each monster and do something with them
    var slice = app.monsters.slice();
    while (slice.next()) |monster_id| {
        const monster = slice.get(monster_id);
        monster.health = 100; // they can never die!
        slice.set(monster_id, monster);

        // But we will delete them anyway :)
        if (monster.health == 0) slice.delete(monster_id);
    }
}
```

Note: since `mach.Objects` maintains a recycling bin, you can safely call `.delete` from inside a for loop - something that might give you a challenge with a normal slice!

## Key difference from Entity Component Systems

If you are coming from other game engines which employ an Entity Component System (ECS), it's worth noting that Mach's object system is _NOT_ an entity component system. It solves a lot of the same problems, we would argue with better tradeoffs, but it has key differences from common ECS approaches.

One key difference is that with an ECS, you have objects with _arbitrary components (struct fields) attached to them_ - this can actually present a challenge when working with objects: you don't have a great way to say 'oh, a button must have _both_ a text_label and a position`. Some ECS try to solve this with 'component bundles', but when getting an individual object you then still don't have a great way to say 'it has to have both components'.

Mach's object system instead has rigid data types, literally a struct with fields:

```zig
monsters: mach.Objects(struct {
    health: f32,
    damage: f32,
}),
```

Now, you might be wondering 'but what if I have an object someone else created, and I know it's not great but I need to attach some data to it without modifying that rigid data type? I don't want to modify that code' - this is where _object relations_ come in: we allow you to arbitrarily attach objects _of different types / from different lists_ to eachother.

## Continue reading: relations

[Object system: relations](../relations)
