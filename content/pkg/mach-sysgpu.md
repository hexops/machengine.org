---
title: "mach sysgpu"
description: "Highly experimental, blazingly fast, lean & mean descendant of WebGPU written in Zig."
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div style="display: flex; flex-direction: column; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/sysgpu-full-dark.svg">
        <img alt="mach-sysgpu" src="/assets/mach/sysgpu-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <span>
        <a href="https://github.com/hexops/mach-sysgpu">GitHub repository</a> | <a href="https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Asysgpu">Issue tracker</a>
    </span>
</div>

Highly experimental, blazingly fast, lean & mean descendant of WebGPU written in Zig.

## Experimental

This is an **experimental** project according to [our stability guarantees](../../about/stability):

> When a project has an experimental warning, it means all bets are off. You should carefully read the warning to understand why the project is experimental, and assume the worst.

**Tracking issue:** https://github.com/hexops/mach/issues/966

## History

We [announced Dusk](https://devlog.hexops.com/2023/mach-v0.2-released/#dusk-experimental-pure-zig-webgpu-implementation), a WebGPU implementation in Zig, as part of the Mach v0.2 release. 

Since then, the project grew to have the goal of [superseding WebGPU](https://github.com/hexops/mach/issues/1055) for native applications. Although the API is still greatly inspired by (and familiar to developers who use) WebGPU, it now stands on its own as a direct competitor to WebGPU.

## Goals

### Modern graphics API

Competitive with other graphics abstraction APIs like WebGPU, SDL3, sokol_gfx, etc.

Feels very cozy to devs familiar with WebGPU, 'a better WebGPU'.

* **Windows:** Direct3D 12
* **Linux:** Vulkan
* **macOS:** Metal
* **iOS:** Metal
* **Android**: Vulkan
* **Browser**: WebGPU

### Alleviate pain points of WebGPU

* Better approach to pipeline creation / descriptors, with an API that supports push constants / optimization when available.
* More integrated approach to binding resources to shaders, type-correctness, etc.

### More modern, performant, and featureful

* WebGPU must support all hardware released in the last 8-12 years, sysgpu only targets hardware in the last 5 years, making our 'baseline' API much more modern.
* WebGPU/Browsers cannot add new features or make breaking changes without committee quorum, implementations in multiple browsers, etc. We can move faster because sysgpu is an implementation, not a specification.
* Support modern functionality as optional extensions, e.g. bindless resources, ray tracing, push constants, multiple queues/async, etc. and graduate them to non-extensions when hardware support is wide enough.

### Offline shader compilation

* Compile shaders fully offline for better runtime performance, and also so you do not have to ship large shader compilation stacks with your binaries.

### Not just for games

Viable for plain desktop/mobile apps, too. We will provide e.g. an OpenGL fallback on platforms like Linux where functional drivers may not exist so that it is viable for plain desktop/mobile apps.

### Other goals

* C API support
* Improved shading language (think: `#include` support, better integration with Zig for type safety, etc.)

## Non-goals

* Support of hardware released more than 5+ years ago (browsers/WebGPU must support hardware released 8-12 years ago), e.g. we will have no ["WebGPU compatibility mode"](https://github.com/gpuweb/gpuweb/issues/4266) equivalent
* Patching and/or working around bad/insecure graphics drivers (browsers/WebGPU must do this and maintains e.g. denylists of drivers.)
* Pure software rendering, e.g. WebGPU/Dawn falls back to a Vulkan software renderer in some cases.
* Bringing your own shading language (via SPIRV or otherwise), we'll bless one shading language and it will be integrated nicely.
* Supporting more than 1 (max 2) backend APIs per platform; in general we will have one backend using the platform's modern-and-widely-supported API, and _sometimes_ one backend as a fallback for systems that have great divergence. We won't support a myriad of backends per platform.
* Support of extremely underpowered hardware (e.g. embedded devices)

## Experimental, not ready for general use

sysgpu is coming along very nicely, with functional backends capable of running most of the mach-core examples already for Direct3D 12, Metal, and Vulkan today. An OpenGL fallback backend is in active development.

We have a functional WGSL parser/compiler/transpiler which in many cases is more correct than Naga (wgpu-native/wgpu-rs WGSL implementation), but shader compilation is an open area of exploration and we are considering replacing WGSL with a Zig(-like?) shading language instead.

Currently it is a nearly fully-functional implementation of `webgpu.h`, but numerous improvements to the actual API are planned.

Join the [Mach Discord community](../../discord) for discussion, keep tabs on [open issues](https://github.com/hexops/mach/issues?q=is%3Aopen+is%3Aissue+label%3Asysgpu) and wait for an announcement that it is generally ready for use.
