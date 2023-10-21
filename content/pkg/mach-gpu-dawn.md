---
title: "mach gpu-dawn"
description: "Google's Dawn WebGPU implementation, cross-compiled with Zig into a single static library "
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div style="display: flex; flex-direction: column; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/gpu-dawn-full-dark.svg">
        <img alt="mach-gpu-dawn" src="/assets/mach/gpu-dawn-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <span>
        <a href="https://github.com/hexops/mach-gpu-dawn">GitHub repository</a> | <a href="https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Agpu-dawn">Issue tracker</a>
    </span>
</div>

Google's [Dawn](https://dawn.googlesource.com/dawn/) WebGPU implementation, cross-compiled with Zig into a single static library, requiring nothing more than `zig` and `git` to build and cross-compile a static Dawn library for every OS:

* No cmake
* No ninja
* No `gn`
* No system dependencies (xcode, etc.)
* Automagic cross compilation out of the box with nothing more than `zig` and `git`!
* Builds a single static `libdawn.a`

## Building from source

This will take ~10 minutes to finish, so by default when using this package a prebuilt binary version of Dawn (see the 'binary releases' section below) but you can always build Dawn from source using:

```sh
DAWN_FROM_SOURCE=true zig build dawn
```

## Binary releases

Dawn (specifically all the shader compilers, and the DirectXShaderCompiler) is a large C++ codebase and takes 5-10 minutes to build on a modern laptop. Since waiting is no fun, we also have binary releases produced by our GitHub actions:

**[View binary releases](https://github.com/hexops/mach-gpu-dawn/releases/latest)**

Here's how to read the downloads provided:

* `_debug.tar.gz` and `_release-fast.tar.gz` are tarballs of the static library + headers for each OS and debug/release mode, respectively.
* `headers.json.gz` is a JSON archive of all the Dawn/WebGPU headers.
* Files ending in `.a.gz` and `.lib.gz` are the individual static `libdawn.a` and `dawn.lib` (Windows) gzippped and distributed. These are provided as individual downloads so there is no need to extract a tarball.

## Important: Building WebGPU API symbols

Dawn and other WebGPU implementations (like the Rust one) do not agree on a standard `webgpu.h` API. Aspirationally, they aim to target the same https://github.com/webgpu-native/webgpu-headers header, but in practice they expose different APIs which are not ABI compatible.

When you call a Dawn `webgpu.h` function, Dawn internally diverts this call through a vtable which must be initialized using a call to `dawnProcSetProcs`.

`mach/gpu-dawn` builds since Oct 17th 2022 no longer include the `webgpu.h` symbols by default. If you intend to actually call the WebGPU API, you should build these two source files as part of your application:

1. [`dawn_proc.c`](https://raw.githubusercontent.com/hexops/dawn/generated-2023-08-10.1691685418/out/Debug/gen/src/dawn/dawn_proc.c)
2. [`webgpu_dawn_native_proc.cpp`](https://raw.githubusercontent.com/hexops/dawn/generated-2023-08-10.1691685418/out/Debug/gen/src/dawn/native/webgpu_dawn_native_proc.cpp)

And call `dawnProcSetProcs` to set up the proc table.

## A warning about API stability

You should be aware:

* WebGPU's API is not formalized yet.
* Dawn's API is still changing.
* The `webgpu.h` API is still changing
* Dawn and gfx-rs/wgpu, although both try to implement `webgpu.h`, do not exactly implement the same interface. There are subtle differences in device discovery & creation for example.

## Generated code

Dawn itself relies on a fairly large amount of dependencies, generated code, etc. To avoid having any dependency on Google build tools, code generation, etc. we maintain [a minor fork of Dawn which has generated code and third-party dependencies comitted in "generated" branches.](https://github.com/hexops/dawn/tree/main/mach) We are usually up-to-date with the upstream within a few weeks on average.

It also provides a [few small patches to enable building Dawn with the Zig compiler](https://github.com/hexops/mach/issues/168) which we plan to upstream soon, as well as some [patches to build the DirectXShaderCompiler with Zig](https://github.com/hexops/mach/issues/151).
