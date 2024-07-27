---
title: "FAQ"
description: "Frequently asked questions about the Mach project"
draft: false
layout: "docs"
docs_type: "about"
rss_ignore: true
---

# Frequently asked questions

## Experimental

Today, Mach is rather experimental.

There won't be one major event where it is suddenly declared stable, rather it will be a bunch of small/incremental releases building up to it. You can look at the [roadmap](/docs/roadmap/) to get an idea of what we're working on currently, and what will come later.

## Can I use Mach to make a simple 2D game?

Quite possibly! Check out [Lord of Zero](https://github.com/hexops/lordofzero/) and [Pixi](https://github.com/foxnne/pixi) for some ideas of what you could do.

## Can I use Mach to make a simple 3D game?

It depends on how comfortable you are with low-level graphics APIs.

* You will need to bring your own:
  * 3D model loading and rendering
  * Physics library
  * GUI library

It will be a while before we have good high-level 3D graphics support; a lot of other pieces need to land first. See the [roadmap](/docs/roadmap/) for details.

## Can I make my own game engine using Mach?

Yes! For example instead of using GLFW/SDL+OpenGL+glm as the base for your own engine, you might choose to use `mach.core` and `mach.math` from our [standard library](../stdlib).
