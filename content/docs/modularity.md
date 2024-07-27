---
title: "Mach modularity"
description: "Opinionated enough to provide a cohesive high-level experience, modular enough to let you use only a subset."
draft: false
layout: "docs"
docs_type: "docs"
rss_ignore: true
---

# Modularity

Mach aims to be opinionated enough to provide a cohesive high-level experience, but modular enough to let you use only a subset of it.

## 'standard library' of Zig gamedev modules

Mach is a ['standard library' of Zig gamedev modules](stdlib). For example, you can import and use just specific parts of Mach like the `mach.math` library and use these to build your own engine.

## Alternative to GLFW/SDL + OpenGL/Vulkan, Raylib, etc

Many folks join the Mach and Zig communities looking to 'make games mostly from scratch' using something minimal like GLFW+OpenGL, SDL+Vulkan, Raylib, etc. but find working with those libraries can be a bit tedious as they are C libraries.

Mach offers a pure Zig alternative to those libraries. Since it is experimental, it's definitely not as polished yet - but you can use just the part of Mach that opens a window, uses a low-level graphics API, and use Zig as your shading language. This is higher-level than GLFW/SDL/OpenGL/Vulkan, but lower-level than libraries like Raylib.

Then, if you like, you can optionally use some higher-level Mach modules for text rendering and other things to move a little-bit closer to something like Raylib.

## Alternative to Unity/Unreal/Godot

This is our ultimate goal, and we're certainly not there yet - but the aim is for Mach's individual modules to ultimately build up to an experience competitive with the big engines of today - but in a much more modular, still cohesive, way.

## What about the full engine, GUI editor, etc.?

The engine is the _overall composition_ of two things:

1. The [Mach standard library](../stdlib) - the engine APIs and 'blessed' paths for doing things, as a bunch of modules.
2. The Mach editor and CLI tooling - coming soon - which will provide standard tools and high-level experiences you'd expect from a game engine - designed to integrate nicely with our module system.

Whether you use both, or how much of either you decide to use, is up to you!

## Can I make my own game engine using Mach?

Yes! For example instead of using SDL+OpenGL, you might choose to rely on just `mach.core` - and if you need a math library you might use `mach.math` - both of which are modules in [the Mach standard library](../stdlib).
