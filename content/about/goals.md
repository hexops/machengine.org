---
title: "Project goals"
description: "A brief overview of the goals of the Mach project, principals we adhere to, etc."
draft: false
layout: "docs"
docs_type: "about"
rss_ignore: true
---

# Mach project goals

For the goals of our engine itself (i.e. how we see the process of game development changing), please see [the Mach engine overview](../engine).

This page covers more broad project goals that apply to all Mach projects, code, standalone libraries, etc.

## Zero-fuss installation

<div>
    <img alt="no more apt-get install" src="/img/not-this-anything-but-this.png" style="width: 20rem; float: left; padding-right: 2rem;"></img>
    <p>All too often we see people get a sudden burst of inspiration: "I'm going to finally start my game/app this weekend!" only to see them utlimately get bogged down by setting up their dev environment, ending their weekend with "well.. at least I got the hello world running" - there is no greater drain on human inspiration.</p>
    <p>This is why Mach focuses so heavily on zero-fuss installation: <strong>you only need Zig, Git, and Curl to use Mach. Nothing else.</strong> No more `apt-get install` lists. No more cmake/ninja/dependency-hell.</p>
</div>

Mach is able to achieve this by doing the heavy lifting of compiling C/C++ dependencies by source for you, using Zig as the C/C++ compiler. We build GLFW, Google Chrome's WebGPU implementation, and much more using just Zig as a C/C++ compiler and avoid make/cmake/ninja/etc by taking on the hard work of using Zig as the build system too.

In some cases building from source can take a few minutes, like building Google Chrome's WebGPU implementation-and we don't want you to have to wait-so we provide binaries by default which are used when you execute `zig build`. We understand the importance of 100% from-source builds, however, and they are possible using compiler flags like `-Ddawn-from-source=true` today (we're aiming to make this even simpler / a single flag. (issue))

## Seamless cross-compilation

At the flip of a switch it is possible to cross-compile to nearly any target:

```
$ zig build -Dtarget=x86_64-windows
$ zig build -Dtarget=x86_64-linux-gnu
$ zig build -Dtarget=x86_64-macos
$ zig build -Dtarget=aarch64-macos
```

This is made possible in a few ways:

1. Zig acts as a C/C++ compiler capable of cross-compilation, shipping libc for each platform.
2. On Linux targets, Zig ships out-of-the-box with support for targetting [_any_ version of glibc](https://github.com/ziglang/glibc-abi-tool/) removing the need for "that outdated Debian box we must build on"
3. Mach itself provides [system SDKs](https://github.com/hexops/mach-system-sdk) which include additional headers and dynamic libraries used for the cross-compilation build process:
   1. Updated DirectX 12 headers (and prior versions)
   2. X11/xcb/Wayland headers
   3. OpenGL and Vulkan headers
   4. Generated Wayland protocol sources
   5. macOS XCode SDK frameworks/headers

Through this, we are able to effectively fetch the required dependencies/headers in Mach's `build.zig` files and as a result `zig build` is able to download all the dependencies needed to build your application.

These dependencies are generally compile-time only, i.e. we use them to link to a dynamic library, but our binaries are not shipped with the application only used for linking. We rely on a very small set of system dependencies effectively guaranteed to be present on any of our supported targets, and all other dependencies are built from source.

See also our [platform support](/about/platforms).
