---
title: "mach-gpu: the WebGPU interface for Zig"
description: "mach-gpu provides a truly cross-platform graphics API for Zig (desktop, mobile, and web) with unified low-level graphics & compute backed by Vulkan, Metal, D3D12, and OpenGL (as a best-effort fallback.)"
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

# The WebGPU interface for Zig

<div style="margin-top: 2rem;">
    <a href="https://github.com/hexops/mach-gpu" class="img-link" style="float: right; padding-left: 1rem;">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/gpu-dark.svg">
            <img alt="mach-gpu" src="/assets/mach/gpu-light.svg" style="width: 20rem; margin-right: 1rem; margin-top: 0.5rem;">
        </picture>
    </a>
    As with all Mach libraries, <a href="../../about/goals#zero-fuss-installation">zero-fuss installation</a>, <a href="../../about/goals#seamless-cross-compilation">cross-compilation</a> at the flip of a switch, and <a href="../../about/platforms">broad platform support</a> is guaranteed.
    <br/>
    <br/>
    <span style="font-family: Orbitron;"><em>Quick links:</em></span>
    <br/>
    <ul style="display: inline-block; width: 25rem;">
        <li><a href="https://github.com/hexops/mach-gpu">mach-gpu on GitHub</a></li>
        <li><a href="https://devlog.hexops.com/2022/perfecting-webgpu-native/">Perfecting WebGPU/Dawn native graphics for Zig</a> (article)</li>
        <li><a href="https://devlog.hexops.com/2021/mach-engine-the-future-of-graphics-with-zig/">Perfecting The future of graphics with Zig</a> (article)</li>
    </ul>
</div>

## Goals

* Allow comptime-defined interception of WebGPU API requests (comptime interfaces.)
* Expose a standard Dawn `webgpu.h`-compliant C ABI, which routes through Zig comptime interfaces.
* Support Dawn (native) and Browser (via WASM/JS) implementations of WebGPU.
* Broad platform support: desktop, mobile, web, consoles in the future.
* First-class Linux support (support Wayland, OpenGL and OpenGL ES fallbacks, etc.)

## Non-goals

* We will not support non-Dawn (e.g. Rust wgpu) implementations if they don't match the same `webgpu.h` interface as Dawn. In general they often match, but not always.
* We will not maintain backwards compatibility with deprecated `webgpu.h` methods for now.

## Features

### Compile-time interface

**mach-gpu** is a low level library providing [a compile-time interface](https://devlog.hexops.com/2022/perfecting-webgpu-native/#comptime-interfaces) to the WebGPU API. Because it is a compile-time interface, it has zero-overhead compared to calling the WebGPU C API directly.

There are multiple _implementations_ of the interface, including:

* [mach-gpu-dawn](mach-gpu-dawn) - backed by Dawn, the native WebGPU implementation used in Google Chrome.
* [mach-gpu-dusk](mach-gpu-dusk) - a highly experimental pure Zig WebGPU implementation
* (future) A WebAssembly implementation, using the browser's builtin implementation.

### gpu.Export

`mach-gpu` provides a `gpu.Export` function which takes a Zig implementation of the WebGPU interface and exposes all of the neccessary functions for a `webgpu.h` compatible C ABI.

This does two things:

1. Makes it possible to expose a Zig WebGPU implementation as a standard C API easily, with type-checking, etc.
2. Allows _intercepting_ WebGPU API calls (even those issued from C libraries) in Zig code. For example, one can intercept all Dawn API calls that Dear Imgui's WebGPU backend issues as a result. This opens the door to exploring some interesting debugging facitilies for WebGPU in the future.

### Quality of life improvements

The library provides a number of quality of life improvements which you can [read about in detail here](https://github.com/hexops/mach-gpu/blob/main/README.md#quality-of-life-improvements), including:

* Zig flag sets
* Default values everywhere to reduce verbosity of descriptor usage.
* Slice helpers instead of raw pointers+lengths.
* Typed callback `userdata` pointers.
* Type-safety for `next_in_chain` extensions
* Helper methods

Despite these, you can _always_ access the raw `webgpu.h` API with none of our helpers on top using `gpu.Impl.foobar()` methods.

## Examples

### WebGPU + GLFW example

Since mach-gpu is just a comptime interface, you must provide an implementation. That implementation must also be bound to e.g. a DirectX/Vulkan/Metal window provided by e.g. GLFW.

We provide <a href="https://github.com/hexops/mach-gpu/tree/main/examples">a standalone example</a> which demonstrates using `mach-gpu`, the `mach-gpu-dawn` implementation, and `mach-glfw` to create the window.

### Consider Mach core

WebGPU requires a bit of setup code, if you are considering using WebGPU + GLFW we encourage considering <a href="../core">Mach core</a> as it would provide you with the same functionality (Window+Input+WebGPU, nothing else) with much broader platform support (e.g. you get mobile/web support in the future for free.)

Even if you decide to just use mach-gpu, you may find the [Mach core examples](../core/examples) to be a helpful resource for learning how to use WebGPU.

## Getting started

### Adding dependency

In a `libs` subdirectory of the root of your project:

```sh
git clone https://github.com/hexops/mach-gpu
```

Then in your `build.zig` add:

```zig
// Import dependencies
const system_sdk = @import("libs/mach-glfw/system_sdk.zig");
const glfw = @import("libs/mach-glfw/build.zig");
const gpu_dawn = @import("libs/mach-gpu-dawn/sdk.zig").Sdk(.{
    .glfw = glfw,
    .glfw_include_dir = "glfw/upstream/glfw/include",
    .system_sdk = system_sdk,
});
const gpu = @import("libs/mach-gpu/sdk.zig").Sdk(.{
    .glfw = glfw,
    .gpu_dawn = gpu_dawn,
});

pub fn build(b: *Builder) !void {
    ...
    // Link to mach-gpu
    exe.addModule("gpu", gpu.module(b));
    try gpu.link(b, exe, .{});
}
```
