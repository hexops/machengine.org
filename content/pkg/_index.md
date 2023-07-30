---
title: "Mach packages: 100% standalone Zig gamedev libraries"
description: "Mach provides a set of 100% standalone, high-quality Zig gamedev libraries on which it is built, they all feature zero-fuss installation, broad platform support, and cross-compilation at the flip of a switch."
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
images: ["/img/mach-opengraph.png"]
---

# Standalone Zig gamedev libraries

Mach provides a set of 100% standalone, high-quality Zig gamedev libraries on which it is built.

All of our libraries feature <a href="../../about/goals#zero-fuss-installation">zero-fuss installation</a>, <a href="../../about/goals#seamless-cross-compilation">cross-compilation</a> at the flip of a switch, and <a href="../../about/goals#platform-support">broad platform support</a>.

Although Mach is developed in a monorepo (one big repository), once we feel libraries are stable generally they are also provided in 100% separate repositories.

## Stable libraries

We haven't reached Mach 1 yet, but there are a handful of libraries we feel have generally reached maturity and expect no major changes to. In the event of a breaking change, we'll always provide [migration notes](../core/migrations.md) walking you through how to upgrade your code.

The following libraries are considered stable:

* [mach-glfw](glfw) - perfected GLFW bindings for Zig
* [mach-gpu](gpu) - the WebGPU interface for Zig
* [mach-freetype](freetype) - Ziggified FreeType 2 bindings

## Experimental libraries

Experimental libraries may have their APIs change without much notice, and you may have to look at recent changes in order to update your code. On each link you will find an **instability reason** which describes why the library is not declared stable yet.

* [mach-sysaudio](experimental#sysaudio) - lightweight cross-platform audio input/output (originally a port of Andrew Kelley's libsoundio to Zig.)
* [mach-sysjs](experimental#sysjs) - provides Zig with the ability to call from WebAssembly into JavaScript.
* [mach-earcut](experimental#earcut) - industrial-strength polygon triangulation.
* [mach-basisu](experimental#basisu) - basis universal (supercompressed textures) for Zig.
* [mach-model3d](experimental#model3d) - Model3D file loading (a format that tries to address the shortcomings of glTF)
* [mach-ecs](experimental#ecs) - the Entity Component System library that we're building as part of an [in-depth blog series](https://devlog.hexops.com/categories/build-an-ecs/) from first-principles.
