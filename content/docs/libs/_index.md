---
title: "Mach libs: 100% standalone Zig gamedev libraries"
description: "Mach provides a set of 100% standalone, high-quality Zig gamedev libraries on which it is built, they all feature zero-fuss installation, broad platform support, and cross-compilation at the flip of a switch."
draft: false
layout: "docs"
rss_ignore: true
---

# Standaone Zig gamedev libraries

Mach provides a set of 100% standalone, high-quality Zig gamedev libraries on which it is built.

All of our libraries feature <a href="../../about/goals#zero-fuss-installation">zero-fuss installation</a>, <a href="../../about/goals#seamless-cross-compilation">cross-compilation</a> at the flip of a switch, and <a href="../../about/goals#platform-support">broad platform support</a>.

Although Mach is developed in a monorepo (one big repository), our stable libraries are provided in 100% separate repositories so you don't even have to download code you do not care about.

## Stable libraries

Stable libraries can expect no major API changes, with minor (sometimes small API breakages) improvements. [Migration notes](../core/migrations.md) are provided in the event that a non-obvious / major change is required.

* [mach/glfw](glfw) - perfected GLFW bindings for Zig
* [mach/gpu](gpu) - the WebGPU interface for Zig
* [mach/freetype](freetype) - Ziggified FreeType 2 bindings

## Experimental

Experimental libraries may have their APIs change without notice.

* [mach/sysaudio](experimental#sysaudio) - lightweight cross-platform audio input/output (originally a port of Andrew Kelley's libsoundio to Zig.)
* [mach/sysjs](experimental#sysjs) - provides Zig with the ability to call from WebAssembly into JavaScript.
* [mach/earcut](experimental#earcut) - industrial-strength polygon triangulation.
* [mach/basisu](experimental#basisu) - basis universal (supercompressed textures) for Zig.
* [mach/model3d](experimental#model3d) - Model3D file loading (a format that tries to address the shortcomings of glTF)
* [mach/ecs](experimental#ecs) - the Entity Component System library that we're building as part of an [in-depth blog series](https://devlog.hexops.com/categories/build-an-ecs/) from first-principles.
