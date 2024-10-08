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

Yes! For example instead of using GLFW/SDL+OpenGL+glm as the base for your own engine, you might choose to use `mach.core` and `mach.math` from our [standard library](/docs/stdlib/).

## How to enable Direct3D debug layers?

Mach programs build in Debug mode have Direct3D debug layers enabled by default, which help to catch graphics pipeline mistakes. They are disabled in release builds.

Microsoft requires enabling graphics debugging in your system settings independently if you want to use them. If you don't have this enabled, Mach will log a warning `note: D3D12 debug layers disabled`.

If you want to fix this, you can enable them in your system settings following [Microsoft's documentation](https://learn.microsoft.com/en-us/windows/win32/direct3d12/directx-12-programming-environment-set-up#debug-layer):

> For Windows 10, to create a device that supports the debug layer, enable the "Graphics Tools" optional feature. On Windows 10 22H2, go to the Settings panel, under System. On older versions of Windows 10, go to the Settings panel, under Apps > Apps & features. Go to Optional Features > Add a feature, and then look for "Graphics Tools".
