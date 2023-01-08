---
title: "Mach core: a modern alternative to SDL/etc"
description: "Mach core is a modern alternative to SDL, GLFW+OpenGL, etc. It is truly cross-platform, featuring desktop, web (soon), and mobile (future) support all under the same Zig & C API. With it you get a window+input+GPU, nothing else. Zero-fuss installation, cross-compilation at the flip of a switch, powered by Google's WebGPU implementation."
draft: false
layout: "docs"
rss_ignore: true
---

# Mach core: a modern alternative to SDL/etc

<p>
    <video autoplay loop muted style="height: 20rem; float: right; padding-left: 1rem;">
        <source src="https://user-images.githubusercontent.com/3173176/210314999-b092b6f2-34ae-45aa-b6e9-c553a034835d.webm" type="video/webm">
    </video>
    <span style="font-family: Orbitron; font-size: 22px;"><em>Window+Input+GPU, nothing else.</em></span>
    <br/>
    <br/>
    As with all Mach libraries, <a href="../about/goals#zero-fuss-installation">zero-fuss installation</a>, <a href="../about/goals#seamless-cross-compilation">cross-compilation</a> at the flip of a switch, and <a href="../about/goals#platform-support">broad platform support</a> is guaranteed.
    </br>
    </br>
    Mach core provides the power of Vulkan, DirectX, Metal, and modern OpenGL in a single concise graphics API - by compiling Google Chrome's WebGPU implementation natively via Zig (no cmake/ninja/gn/etc) into a single static library.
    <br/>
    <br/>
    Supports Windows, Linux, and macOS today. WebAssembly and Mobile will also be supported under the same API in the near future.
</p>


## Modern graphics API

The power of Vulkan, DirectX, Metal, and modern OpenGL is exposed in a concise, modern graphics API - including compute - on native and web targets using Google Chrome's WebGPU implementation.

Prebuilt binaries are used by default so you don't even have to wait for compilation, but you can always simply add `-Ddawn-from-source=true` for a 100% from-source build without dealing with any external build systems or dependencies: just Zig, git, and curl. No more cmake/ninja/gn/apt-get/etc.

## Zig and C APIs

Mach core can be used from Zig today, but we also have an experimental C ABI. Using Zig as your C compiler, you can also reach the same exact targets (desktop/web/mobile) using one truly cross-platform API.

## Example showcase

We have an [example showcase](examples) with 16+ Zig examples, including:

* texturing
* PBR
* 3D model loading
* instancing
* post processing
* cube mapping
* boids
* image-blur

..and much more.

## First-class Linux support

We aim to truly support Linux. Native Vulkan, and OpenGL/GLES fallbacks, plus support for both X11 and Wayland in the same binary via runtime detection.

From mesa drivers-to your experimental compositor-and broken vsync implementation, we'll make it run as well as we can.

## Standalone libraries

It's worth noting that Mach provides a handful of [100% standalone standard libraries](../libs) for game development in Zig that pair well with Mach core. These are entirely optional separate repositories you may want to check out.

## Getting started

To get started using Mach core in your own project, see our [getting started](getting-started) guide.
