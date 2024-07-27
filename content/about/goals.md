---
title: "Project goals"
description: "General goals of the Mach project"
draft: false
layout: "docs"
docs_type: "about"
rss_ignore: true
---

# Project goals

This page covers general project goals of Mach. Besides what you see on the homepage, we care about..

## Zero-fuss installation

<div>
    <img alt="no more apt-get install" src="/img/not-this-anything-but-this.png" style="width: 20rem; float: left; padding-right: 2rem;"></img>
    <p>All too often we see people get a sudden burst of inspiration: "I'm going to finally start my game/app this weekend!" only to see them utlimately get bogged down by setting up their dev environment, ending their weekend with "well.. at least I got the hello world running" - there is no greater drain on human inspiration.</p>
    <p>This is why Mach focuses so heavily on zero-fuss installation: <strong>you only need Zig to use Mach. Nothing else.</strong> No more `apt-get install` lists. No more cmake/ninja/dependency-hell.</p>
    <p>Mach is able to achieve this through very careful curation of its dependencies, relying on C/C++ dependencies only when absolutely neccessary, and making sure we put in the effort to compile them for you using the Zig build system.</p>
</div>

## Seamless cross-compilation

At the flip of a switch it is possible to cross-compile to nearly any target:

```
$ zig build -Dtarget=x86_64-windows
$ zig build -Dtarget=x86_64-linux-gnu
$ zig build -Dtarget=x86_64-macos
$ zig build -Dtarget=aarch64-macos
```

## First class Linux support

* Easily cross-compile for Linux from any host OS (Zig ships out-of-the-box with support for targetting [_any_ version of glibc](https://github.com/ziglang/glibc-abi-tool/) removing the need for "that outdated Debian box we must build on")
* Support both X11 and Wayland, in a single binary, chosen at runtime based on what the system has available / what the user wants.
* Support both modern Vulkan, and OpenGL for less-powerful desktop Linux devices (think: Raspberry Pi) that do not support Vulkan easily yet.

See also our [platform support](../platforms) in general.
