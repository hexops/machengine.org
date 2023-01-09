---
title: "Mach libs: 100% standalone Zig gamedev libraries"
description: "Mach provides a set of 100% standalone, high-quality Zig gamedev libraries on which it is built, they all feature zero-fuss installation, broad platform support, and cross-compilation at the flip of a switch."
draft: false
layout: "docs"
rss_ignore: true
---

# Mach standalone libraries

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

