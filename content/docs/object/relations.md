---
title: "Object system: relations"
description: "Mach object relations enable you to arbitrarily create parent-child relations between objects, or attach arbitrary data to objects."
draft: false
layout: "docs"
docs_type: "docs"
rss_ignore: true
---

# Object system: relations

Mach object _relations_ are a key concept of [the Mach object system](../) and enable you to arbitrarily create parent-child relations between objects.

Among other things, this allows for attaching _your own arbitrary data_ to _someone else's object_ - a form of relaxed type constraint which enable you to quickly iterate on your codebase. **Mach's object system is not an Entity Component System* ([it's better!](../objects#key-difference-from-entity-component-systems)), but ECS typically enables this form of relaxed type constraint to enable fast iteration - and _object relations_ are how we provide this flexibility.

## Relations are ObjectID <-> ObjectID

As discussed in [the objects section](../objects#object-ids), objects have IDs which pack a bunch of information including which module and set of objects the ID came from, the actual array index for O(1) lookups, a generation counter for use-after-free detection, and more.

Mach stores parent-child relations as a mapping of object IDs pointing to other object IDs. This means that you can attach say a `monster` object to a `window` object - they don't have to be from the same module or same list of objects.

## The parallelism problem

One challenge in representing object relations on top of [`mach.Objects`](../objects) is that - since each is a list of objects _owned by someone_ - potentially different threads! If we want to allow objects from _one list of objects_ to have parents and children in _another list of objects_ which are owned by a different thread.. things get tricky!

A naive solution to this might be to introduce a global mutex around the graph of object relations. Unfortunately, this would mean that any thread interacting with object relations is blocked on every other thread looking to do the same (Hello, Python interpreter GIL, anyone?)

Mach uses a much more clever solution (thanks to some fantastic advice from kprotty, the famous program optimizer, concurrency/IO guy, and Zig core team member.)

## How Mach's object system stores relations

Mach maintains a single global graph, where objects owned by any threads' can have parents/children which are objects owned by other threads'.

The trick is that instead of maintaining a global mutex (or using _any locks at all_), we enable reads/writes/mutations to the graph in parallel from any thread by representing all interactions with the graph as /operations/ enqueued to a lock-free Multi Producer, Single Consumer (MPSC) FIFO queue, with each thread becoming the single consumer /temporarily/ only if there are operations to process.

When an operation is desired (adding a parent to a child, querying the children or parent of a node, etc.) it is enqueued. Then, if the queue contains entries, that thread steals the entire queue - becoming the single consumer of the MPSC queue temporarily - generally only blocking _reads_ by other threads - and only as long as is needed to process the few pending operations that were enqueued.

Lastly, we use lock-free pools of nodes and queue entries to allow for pre-allocating nodes in the graph, and queue entries - potentially based on the applications' actual measured usage to eliminate runtime allocations in future builds of the program.

## API usage

Object relations are accessible through any `mach.Objects` list, using the following APIs:

* `.is(object_id)` returns a bool indicating if the given object is alive, valid, and from this pool of objects.
* `.getParent(child_id)` -> returns an error, null, or parent object ID
* `.setParent(child_id, parent_id)`
* `.addChild(parent_id, child_id)`
* `.removeChild(parent_id, child_id)`
* `.getChildren(parent_id)` -> returns an error or `results` object with dynamic-size `.items` `[]const ObjectID` field
  * Call `results.deinit()` to return memory for reuse by future `getChildren()` calls.

Consult the actual code for specific behavior.

## That's all there is to it!

Congratulations, you've read all the documentation for the Mach object system!
