---
title: "Platform support - Mach engine"
description: "Platforms and Zig versions Mach supports"
draft: false
layout: "docs"
docs_type: "about"
rss_ignore: true
---

## Supported Zig versions

All of Mach is tested with [this Zig version](https://github.com/hexops/mach#supported-zig-version), which is usually (but not always) the latest Zig nightly version. Sometimes newer versions will work, older versions almost never work due to occassional minor changes in the Zig standard library APIs.

## Platform support

We aim to support a broad array of operating systems and architectures, as long as they are reasonably used by desktop/mobile consumers, or someone would like to contribute and maintain support for them.

| OS             | x86_64 | aarch64 | WebAssembly | notes                                                                                                                                                        |
| -------------- | ------ | ------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| macOS          | ✅      | ✅       |             | last 3 major versions supported;                                                                                                                             |
| Windows        | ✅      | 🏃       |             | windows 7+ supported; ARM support is WIP                                                                                                                     |
| Linux          | ✅      | 🏃       |             | linux ARM support WIP                                                                                                                                        |
| SteamOS (deck) | ✅      |         |             | truly native (Vulkan); no controller/OS integration yet; [demo video](https://devlog.hexops.com/2022/perfecting-webgpu-native/#dawnwebgpu-on-the-steam-deck) |
| Browser        |        |         | 🏃           | WebGPU not working; audio, input, recompile-on-reload, etc. is working                                                                                       |
| iOS            |        | 💭       |             | contributions welcome; planned in future                                                                                                                     |
| Android        |        | 💭       |             | contributions welcome; planned in future                                                                                                                     |

Standalone libraries have some caveats to the above:

| Project  | Caveats                                                                                                           |
| -------- | ----------------------------------------------------------------------------------------------------------------- |
| sysaudio | not yet supported on macOS; we're actively fixing this actively. (issue)                                          |
| basisu   | WebAssembly target not tested (issue)                                                                             |
| model3d  | WebAssembly target not tested (issue)                                                                             |
| freetype | WebAssembly target not tested (issue)                                                                             |
| GLFW     | only works on desktop platforms; Mach core provides an abstraction layer above this that is truly cross-platform. |
| gamemode | linux-only (by nature)                                                                                            |
| sysjs    | WebAssembly-only (by nature)                                                                                      |

## Console support

Console support is a goal <em>in future years</em>, but we're realistic this will not happen anytime soon.

Zig has a work-in-progress C backend, which enables Zig projects to compile themselves to C code which can then be compiled using a standard C compiler. We will leverage this in order to compile Mach games using console's official SDKs, when the time comes.

Our intention is for Hexops (game company) to offer private access to a set of _plugins_ that will enable console support/features, under all neccessary NDAs/legal agreements which console manufacturers require of partners and publishers. We are optimistic about offering this as an at-cost service, with no intention of making profits from it.
