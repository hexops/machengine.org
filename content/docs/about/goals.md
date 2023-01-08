---
title: "Project goals - Mach engine"
description: "This page provides a brief overview of the goals of Mach, principals we hold to, etc."
draft: false
layout: "docs"
rss_ignore: true
---

# Mach project goals

For the goals of our engine itself (i.e. how we see the process of game development changing), please see [the Mach engine overview](../engine).

This page covers more broad project goals that apply to all Mach projects, code, standalone libraries, etc.

## Zero-fuss installation

<div>
    <img alt="no more apt-get install" src="https://user-images.githubusercontent.com/3173176/159140683-0714eb12-806a-43e5-980f-63aa0d998fc2.png" style="width: 20rem; float: left; padding-right: 2rem;"></img>
    <p>All too often we see people get a sudden burst of inspiration: "I'm going to finally start my game/app this weekend!" only to see them utlimately get bogged down by setting up their dev environment, ending their weekend with "well.. at least I got the hello world running" - there is no greater drain on human inspiration.</p>
    <p>This is why Mach focuses so heavily on zero-fuss installation: <strong>you only need Zig, Git, and Curl to use Mach. Nothing else.</strong> No more `apt-get install` lists. No more cmake/ninja/dependency-hell.</p>
</div>

Mach is able to achieve this by doing the heavy lifting of compiling C/C++ dependencies by source for you, using Zig as the C/C++ compiler. We build GLFW, Google Chrome's WebGPU implementation, and much more using just Zig as a C/C++ compiler and avoid make/cmake/ninja/etc by taking on the hard work of using Zig as the build system too.

In some cases building from source can take a few minutes, like building Google Chrome's WebGPU implementation-and we don't want you to have to wait-so we provide binaries by default which are used when you execute `zig build`. We understand the importance of 100% from-source builds, however, and they are possible using compiler flags like `-Ddawn-from-source=true` today (we're aiming to make this even simpler / a single flag. (issue))

## Seamless cross-compilation

At the flip of a switch it is possible to cross-compile to nearly any target:

```
$ zig build -Dtarget=x86_64-windows
$ zig build -Dtarget=x86_64-linux
$ zig build -Dtarget=x86_64-macos.12
$ zig build -Dtarget=aarch64-macos.12
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

## Platform support

We aim to support a broad array of operating systems and architectures, as long as they are reasonably used by desktop/mobile consumers or someone would like to contribute and maintain support for them.

| OS             | x86_64 | aarch64 | WebAssembly | notes                                                                                                                                                        |
| -------------- | ------ | ------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| macOS          | ✅      | ✅       |             | last 3 major versions supported;                                                                                                                             |
| Windows        | ✅      | 🏃       |             | windows 7+ supported; windows ARM support in progress                                                                                                        |
| Linux          | ✅      | 🏃       |             | linux ARM support in progress                                                                                                                                |
| SteamOS (deck) | ✅      |         |             | truly native (Vulkan); no controller/OS integration yet; [demo video](https://devlog.hexops.com/2022/perfecting-webgpu-native/#dawnwebgpu-on-the-steam-deck) |
| Browser        |        |         | 🏃           | everything except WebGPU working.                                                                                                                            |
| iOS            |        | 💭       |             | contributions welcome; planned in future                                                                                                                     |
| Android        |        | 💭       |             | contributions welcome; planned in future                                                                                                                     |

Please note there are some project/feature-specific caveats to the above:

| Project  | Caveats                                                                                                           |
| -------- | ----------------------------------------------------------------------------------------------------------------- |
| sysaudio | not yet supported on macOS; we'd like to fix this soon. (issue)                                                   |
| basisu   | WebAssembly target not tested (issue)                                                                             |
| model3d  | WebAssembly target not tested (issue)                                                                             |
| freetype | WebAssembly target not tested (issue)                                                                             |
| GLFW     | only works on desktop platforms; Mach core provides an abstraction layer above this that is truly cross-platform. |
| gamemode | linux-only by nature                                                                                              |
| sysjs    | WebAssembly-only by nature                                                                                        |

## Console support

Console support is a goal <em>in future years</em>, but we're realistic this will not happen soon. From a technical POV it will be achieved by nature of compiling your Zig project into C/C++ code (which Zig supports as an output target) and using the console's native C/C++ toolchain for final compilation/linkage.

We intend for Hexops to offer a private, minimal set of plugins that will enable console support/features behind the necessary NDAs/legal agreements console manufacturers require of partners and publishers. We are optimistic about offering this as an at-cost service.
