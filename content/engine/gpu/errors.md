---
title: "GPU error handling"
description: "How GPU error handling works, pushing and popping error scopes & how to debug things"
draft: false
layout: "docs"
docs_type: "engine"
rss_ignore: true
---

# GPU error handling

## Asynchronous nature

GPUs have largely asynchronous APIs: you build up a command buffer which encodes a number of commands instructing the GPU to do something, and then you ask the GPU to execute that buffer of commands. As a result, errors must be handled asynchronously as well. `try` isn't going to work here.

## Error scopes

A concept of _error scopes_ is used, where you can push an error scope onto the stack and pop an error scope. Commands that produce errors while the error scope was on the stack will result in _that_ error scope's callback being invoked. Let's look at a concrete example:

### Catching a shader compilation error

```zig
// Push a validation error scope, so that if compiling the shader fails we'll
// be able to handle that error.
core.device().pushErrorScope(.validation);

// Compile our fragment shader.
var fs_module = core.device().createShaderModuleWGSL("my fragment shader", fragment_shader_code);

// Pop our error scope. If compilation fails then we'll get a callback.
var error_occurred: bool = false;
_ = core.device().popErrorScope(&error_occurred, struct {
    inline fn callback(ctx: *bool, typ: gpu.ErrorType, message: [*:0]const u8) void {
        if (typ != .no_error) {
            std.debug.print("🔴🔴🔴🔴:\n{s}\n", .{message});
            ctx.* = true;
        }
    }
}.callback);
if (error_occurred) {
    // Our fragment shader failed to compile, so fallback to a different fragment shader.
    fs_module = core.device().createShaderModuleWGSL(
        "black_screen_frag.wgsl",
        @embedFile("black_screen_frag.wgsl"),
    );
}
defer fs_module.release();
```

Many GPU operations, like compiling shaders, are asynchronous and are only executed later on - not immediately when the function to perform an operation is invoked. This is why error scopes make sense: it allows you to handle _asynchronous errors_.

## Debugging

### Naming objects

At many points, when creating an object there is a `label` parameter or field you can specify to _name an object_. This is very useful in debugging, as GPU error messages will include the error when pointing at e.g. pipeline validation errors.

### RenderDoc & other tools

You may wish to use [RenderDoc](https://renderdoc.org/) and [AMD Radeon GPU Profiler](https://gpuopen.com/rgp/) or [NVIDIA Visual Profiler](https://developer.nvidia.com/nvidia-visual-profiler).
