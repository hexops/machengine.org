---
title: "FAQ"
description: "Frequently asked questions about the Mach project"
draft: false
layout: "docs"
docs_type: "about"
rss_ignore: true
---

# Frequently asked questions

## When will the engine be released?

There won't be one major event, rather it will be a bunch of small/incremental releases building up to it. You can look at the [engine roadmap](/engine/roadmap/) to get an idea of what we're working on currently, and what will come later.

## Can I use Mach to make a simple 2D game?

Using the _engine_? Definitely not today.

Using _Mach core_, maybe:

* There is a [sprite2d example](/core/examples/#sprite2d) which lets you load a JSON texture atlas and draws sprites on the screen you could use as a starting point. However, it is ~400 lines of code, a good amount of that is low-level graphics programming.
* You will need to bring your own:
  * Math library
  * Physics library
  * GUI library
  * Text rendering (though we have freetype bindings you can use, text rendering is quite involved.)

If what you are looking for is a high-level simple 2D graphics API, we don't have that today. I suggest you look elsewhere for right now; I'm a big fan of [Raylib](https://www.raylib.com) and there are people using it from Zig.

We are actively working on higher-level engine APIs that will make simple 2D games nice to build in Zig, but they're not ready for use yet. See the [engine roadmap](/engine/roadmap/) for details.

## Can I use Mach to make a simple 3D game?

Using the _engine_? Definitely not today.

Using _Mach core_, maybe:

* There are examples for 3D model loading, however the examples for this are ~1000 lines of code and a good amount of the code is low-level graphics programming.
* You will need to bring your own:
  * Math library
  * Physics library
  * GUI library
  * Text rendering (though we have freetype bindings you can use, text rendering is quite involved.)

It will be a while before we have good high-level 3D graphics support; a lot of other pieces need to land first. See the [engine roadmap](/engine/roadmap/) for details.
