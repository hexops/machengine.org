---
title: "Platform support"
description: "Platforms that Mach supports"
draft: false
layout: "docs"
docs_type: "about"
rss_ignore: true
---

## Platform support

We aim to support a broad array of operating systems and architectures, as long as they are reasonably used by desktop/mobile consumers, or someone would like to contribute and maintain support for them.

| OS             | x86_64 | aarch64 | WebAssembly | notes                                                                                                                                                        |
| -------------- | ------ | ------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| macOS          | ✅      | ✅       |             | last 3 major versions supported;                                                                                                                             |
| Windows        | ✅      | 🏃       |             | windows 7+ supported; ARM support is WIP                                                                                                                     |
| Linux          | ✅      | ✅       |             |                                                                                                                                                              |
| SteamOS (deck) | ✅      |         |             | truly native (Vulkan); no controller/OS integration yet; [demo video](https://devlog.hexops.com/2022/perfecting-webgpu-native/#dawnwebgpu-on-the-steam-deck) |
| Browser        |        |         | 🏃           | WebGPU not working; audio, input, recompile-on-reload, etc. is working                                                                                       |
| iOS            |        | 💭       |             | contributions welcome; planned in future                                                                                                                     |
| Android        |        | 💭       |             | contributions welcome; planned in future                                                                                                                     |

## Console support

Console support is a goal <em>in future years</em>, but we're realistic this will not happen anytime soon.

Zig has a work-in-progress C backend, which enables Zig projects to compile themselves to C code which can then be compiled using a standard C compiler. We will leverage this in order to compile Mach games using console's official SDKs, when the time comes.

Our intention is for Hexops (game company) to offer private access to a set of _plugins_ that will enable console support/features, under all neccessary NDAs/legal agreements which console manufacturers require of partners and publishers. We are optimistic about offering this as an at-cost service, with no intention of making profits from it.
