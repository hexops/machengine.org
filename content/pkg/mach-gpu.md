---
title: "mach gpu"
description: "The WebGPU interface for Zig"
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div class="centered">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/gpu-full-dark.svg">
        <img alt="mach-gpu" src="/assets/mach/gpu-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <span>
        <a href="https://github.com/hexops/mach-gpu">GitHub repository</a> | <a href="https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Agpu">Issue tracker</a>
    </span>
</div>

The WebGPU interface for Zig, featuring:

* [Zero-fuss](../../about/goals#zero-fuss-installation) installation, [cross-compilation](../../about/goals#seamless-cross-compilation) at the flip of a switch, and [broad platform support](../../about/platforms).
* 100% API coverage. Every function, type, constant, etc. has been exposed in a ziggified API.
* Desktop, Steam Deck, (soon) web, and (future) mobile support.
* A modern graphics API similar to Metal, Vulkan, and DirectX 12. 
* Cross-platform shading language
* Compute shaders
* Advanced GPU features where hardware support is available.

## Benefits of mach/gpu and WebGPU 

`mach/gpu` is a zero-cost idiomatic Zig interface to [the next-generation WebGPU API](https://www.w3.org/TR/webgpu/), which supersedes WebGL and exposes the common denominator between the latest low-level graphics APIs (Vulkan, Metal, D3D12) in the web.

Despite its name, [WebGPU was built with native support in mind](http://kvark.github.io/web/gpu/native/2020/05/03/point-of-webgpu-native.html) and has substantial investment from Mozilla, Google, Microsoft, Intel, and Apple.

When targeting WebAssembly, `mach/gpu` merely calls into the browser's native WebGPU implementation.

When targeting native platforms, we build Google Chrome's WebGPU implementation, [Dawn](https://dawn.googlesource.com/dawn) using Zig as the C/C++ compiler toolchain. We bypass the client-server sandboxing model, and use `zig build` (plus a lot of hand-holding) to support zero-fuss cross compilation & installation without any third-party Google tools, libraries, etc. Just `zig` and `git` needed, nothing else.

## Perfecting WebGPU for Zig

There is a detailed write-up of how we've been [perfecting WebGPU for Zig](https://devlog.hexops.com/2022/perfecting-webgpu-native).

## Usage

On your own, this involves creating a window (using GLFW, and other APIs if you want Web, Mobile, or other platform support), using Dawn's API to create a device and bind it to that window, using OS-specific APIs to get the window handle to bind, etc. `examples/main.zig` demonstrates how to do this. There's a fair amount of setup code involved.

You may also want to consider using _Mach core_.

## Goals

* Allow comptime-defined interception of WebGPU API requests (comptime interfaces.)
* Expose a standard Dawn `webgpu.h`-compliant C ABI, which routes through Zig comptime interfaces.
* Support Dawn and Browser (via WASM/JS) implementations of WebGPU.
* Broad platform support: desktop, mobile, web, consoles.
* First-class Linux support (Wayland, OpenGL and OpenGL ES fallbacks, etc.)

## Non-goals

* Support non-Dawn (e.g. Rust WebGPU) implementations if they don't match the same `webgpu.h` as Dawn.
* Maintain backwards compatibility with deprecated `webgpu.h` methods.

## Getting started

Create a `build.zig.zon` in your project (replace `LATEST_COMMIT` with the latest commit hash):

```zig
.{
    .name = "mypkg",
    .version = "0.1.0",
    .dependencies = .{
        .mach_gpu = .{
            .url = "https://pkg.machengine.org/mach-gpu/LATEST_COMMIT.tar.gz",
        },
    },
}
```

Run `zig build` in your project, and the compiler will instruct you to add a `.hash = "..."` field next to `.url`:

```
note: expected .hash = "12209838fcfb7a77d2d6931efdc7448c033a1b7dad11d082c94bbeeba9d1038cd311",
```

Then use the dependency in your `build.zig`:

```zig
pub fn build(b: *std.Build) void {
    ...
    exe.root_module.addImport("mach-gpu", b.dependency("mach_gpu", .{
        .target = target,
        .optimize = optimize,
    }).module("mach-gpu"));
}
```

You can now use it in your `src/main.zig` file:

```zig
const gpu = @import("mach-gpu");
```

### Ran into trouble?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.

## Quality of life improvements

We make the following quality of life improvements.

### Flag sets

See [perfecting WebGPU for Zig](https://devlog.hexops.com/2022/perfecting-webgpu-native).

### Optionality & nullability

* Optional values default to their zero value (either `null` or a struct constructor `.{}`) when specified as `optional` in `dawn.json`. This means things like `label`, `next_in_chain`, etc. do not need to be specified.
* Fields representing a slice with a `_count` field are nullable pointers defaulting to null and 0 by default.

### Slice helpers

Some WebGPU APIs expose slices as pointers and lengths, we either wrap these to provide a slice or alter the method directly to provide a slice (if little overhead.) The original C-style API can always be accessed via the `gpu.Impl` type in any case.

The slice helpers are:

* `Adapter.enumerateFeaturesOwned`
* `Buffer.getConstMappedRange`
* `Buffer.getMappedRange`
* `CommandEncoder.writeBuffer`
* `ComputePassEncoder.setBindGroup`
* `Device.enumerateFeaturesOwned`
* `Queue.writeTexture`
* `Queue.writeBuffer`
* `RenderPassEncoder.executeBundles`
* `RenderBundleEncoder.setBindGroup`
* `RenderPassEncoder.setBindGroup`

And, to initialize data structures with slices in them, the following helpers are provided:

* `BindGroupLayout.Descriptor.init`
* `BindGroup.Descriptor.init`
* `dawn.TogglesDescriptor.init`
* `Device.Descriptor.init`
* `PipelineLayout.Descriptor.init`
* `QuerySet.Descriptor.init`
* `RenderBundleEncoder.Descriptor.init`
* `Texture.Descriptor.init`
* `ComputePassDescriptor.init`
* `RenderPassDescriptor.init`
* `ProgrammableStageDescriptor.init`
* `VertexBufferLayout.init`
* `VertexState.init`
* `FragmentState.init`
* `CompilationInfo.getMessages`

### Typed callbacks

Most WebGPU callbacks provide a way to provide a `userdata: *anyopaque` pointer to the callback for context. We alter these APIs to expose a typed context pointer instead (again, the original API is always available via the `gpu.Impl` type should you want it):

* `Instance.requestAdapter`
* `Adapter.requestDevice`
* `Queue.onSubmittedWorkDone`
* `Buffer.mapAsync`
* `ShaderModule.getCompilationInfo`
* `Device.createComputePipelineAsync`
* `Device.createRenderPipelineAsync`
* `Device.popErrorScope`
* `Device.setDeviceLostCallback`
* `Device.setLoggingCallback`
* `Device.setUncapturedErrorCallback`

### next_in_chain extension type safety

WebGPU exposes struct types which are extendable arbitrarily, often by implementation-specific extensions. For example:

```zig
const extension = gpu.Surface.DescriptorFromWindowsHWND{
  .chain = gpu.ChainedStruct{.next = null, .s_type = .surface_descriptor_from_windows_hwnd},
  .hinstance = foo,
  .hwnd = bar,
}
const descriptor = gpu.Surface.Descriptor{
  .next_in_chain = @ptrCast(?*const ChainedStruct, &extension),
};
```

Here `gpu.Surface.Descriptor` is a concrete type. The `next_in_chain` field is set to an arbitrary pointer which follows the `gpu.ChainedStruct` pattern: it must begin with a `gpu.ChainedStruct` where the `s_type` identifies which fields may follow after, and `.next` could theoretically chain more extensions on too.

Complexity aside, `next_in_chain` is not type safe! It cannot be, because such an extension could be implementation-specific. To make this safer, we instead change the `next_in_chain` field type to be a union, where one option is the type-unsafe `generic` pointer, and the other options are known extensions:

```zig
pub const NextInChain = extern union {
    generic: ?*const ChainedStruct,
    from_windows_hwnd: *const DescriptorFromWindowsHWND,
    // ...
};
```

Additionally we initialize `.chain` with a default value, making our earlier snippet look like this in most cases:

```zig
const descriptor = gpu.Surface.Descriptor{
  .next_in_chain = .{.from_windows_hwnd = &.{
    .hinstance = foo,
    .hwnd = bar,
  }},
}
```

### Others

* `Device.createShaderModuleWGSL` (helper to create WGSL shader modules more nicely)

There may be other opportunities for helpers, to improve the existing APIs, or add utility APIs on top of the existing APIs. If you find one, please open an issue we'd love to consider it.
