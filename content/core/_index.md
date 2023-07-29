---
title: "mach-core: window+input+GPU, truly cross-platform"
description: "mach-core is an alternative to your traditional SDL or GLFW+OpenGL, etc. setup. It is truly cross-platform, featuring desktop, web (soon), and mobile (future) all under a single unified API. Zero-fuss installation, cross-compilation at the flip of a switch, powered by Google's WebGPU implementation."
draft: false
layout: "docs"
docs_type: "core"
rss_ignore: true
images: ["/img/mach-opengraph.png"]
---

# Mach core: Window+Input+GPU, truly cross-platform

<p>
    <video autoplay loop muted style="height: 20rem; float: right; padding-left: 1rem;">
        <source src="https://user-images.githubusercontent.com/3173176/210314999-b092b6f2-34ae-45aa-b6e9-c553a034835d.webm" type="video/webm">
    </video>
    Provides <em>the power of Vulkan, DirectX, Metal, and modern OpenGL in a single concise graphics API and shader language</em> - by compiling Google Chrome's WebGPU implementation natively using Zig.
    </br>
    </br>
    <em>No more cmake/ninja/gn/apt-get/etc - just Zig, Git, and `curl`</em>; and at the flip of a switch you can seamlessly cross-compile for Windows/Linux/macOS, with browser support (in development), and mobile support (coming in the future) - all under a single unified API.
    </br>
    </br>
    <a href="../about/goals#zero-fuss-installation">Zero-fuss installation</a>, <a href="../about/goals#seamless-cross-compilation">cross-compilation</a> at the flip of a switch, and <a href="../about/goals#platform-support">broad platform support</a> is our goal.
</p>

## Under the hood

We use Google Chrome's WebGPU implementation, Dawn, but we compile it using Zig as the C/C++ compiler, and use Zig's build system and package manager instead of cmake/gn/depot_tools/etc.

On desktop platforms, we use GLFW to create windows, set up Vulkan/Direct3D/etc. and provide an abstraction layer on top that will enable browser and mobile support in the future under the same API.

By default, we use prebuilt binaries of Dawn (the WebGPU implementation) so that you don't have to wait for compilation, and also so that you can use a release build in your debug application for nice performance while developing your games/apps. But 100% from-source builds are always available at the flip of a switch `-Ddawn-from-source=true`. We use Zig's package manager to fetch the few libraries/headers we need to build from source, so you don't need to deal with with any external build systems or dependencies: just zig, git, and curl.

## Example showcase

<a href="https://user-images.githubusercontent.com/3173176/173177664-2ac9e90b-9429-4b09-aaf9-b80b53fee49f.gif"><img align="left" src="https://user-images.githubusercontent.com/3173176/173177664-2ac9e90b-9429-4b09-aaf9-b80b53fee49f.gif" alt="example-advanced-gen-texture-light" height="190px"></img></a>
<a href="https://user-images.githubusercontent.com/3173176/163936001-fd9eb918-7c29-4dcc-bfcb-5586f2ea1f9a.gif"><img align="left" src="https://user-images.githubusercontent.com/3173176/163936001-fd9eb918-7c29-4dcc-bfcb-5586f2ea1f9a.gif" alt="example-boids" height="190px"></img></a>
<a href="https://user-images.githubusercontent.com/3173176/173177646-a3f0982c-f07b-496f-947b-265bdc71ece9.gif"><img src="https://user-images.githubusercontent.com/3173176/173177646-a3f0982c-f07b-496f-947b-265bdc71ece9.gif" alt="example-textured-cube" height="190px"></img></a>

We have an [example showcase](examples) with 15+ Zig examples, including:

* texturing, basic 2D and 3D examples
* PBR, post-processing & deferred rendering
* 3D model loading
* instancing
* cube mapping
* **GPU compute** (boids flocking simulations, simple map-async)

..and much more.

## Getting started

To get started using Mach core in your own project, see our [getting started](getting-started) guide.

## First-class Linux support

Supporting every Linux distro and setup out there is hard - but we are providing first-class support:

* Both X11 and Wayland in the same binary (via runtime detection.)
* Native Vulkan support, with OpenGL/GLES fallbacks
* [gamemode support](https://github.com/hexops/mach-gamemode) enabled by default, for CPU governor, I/O priority, GPU performance mode & other optimizations to be enabled _only if_ you have gamemode installed on your system.
* NixOS [usage instructions](../about/nixos-usage.md)
* [Workarounds](../about/known-issues/#linux) as best we can when your mesa drivers, experimental compositor, or broken vsync implementation might just not be working as intended.

## C API / language bindings

Today mach-core can be used from Zig, but we are aiming to have a C ABI so that it can be used from other languages and run on the same target platforms (desktop/web/mobile) using one truly cross-platform API.

## (optional) companion libraries

Outside of mach-core, we also provide a handful of [100% standalone standard Zig libraries](../libs) for game development that pair well with Mach core. These are entirely optional (separate repositories) that you may want to check out for audio I/O, 3D model loading, etc.
