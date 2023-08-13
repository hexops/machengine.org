---
title: "GPU memory management"
description: "Explains GPU memory management, alignment requirements, etc."
draft: false
layout: "docs"
docs_type: "engine"
rss_ignore: true
---

# GPU memory management

## Reference counting

GPU objects like `gpu.Texture`, `gpu.Buffer`, or any other object which has a `.reference`, `.release` and `.destroy` method - use reference counting.

Although we love explicit memory management, GPU memory is perhaps _one of the best use-cases for reference counting._ All WebGPU objects are reference counted, and it's not just because it originated as a browser API.

### Guidance

Use `.reference()` and `.release()` to release memory of objects. When the reference count reaches zero, `.destroy()` will be called automatically for you.

Use-after-free is possible (e.g. passing a texture whose reference count has reached 0 into an API.)

In the browser, `.reference()` and `.release()` are managed by the JavaScript garbage collector - and as a result, an additional `.destroy()` option is provided which lets you explicitly request an object be freed, so you can get GPU memory back without being at the mercy of the JS garbage collector. Whenever the reference count reaches zero, `.destroy()` is automatically called for you.

## Memory alignment

GPUs and underlying graphics APIs have unique memory alignment requirements:

* Uniforms: 16-byte alignment
* Buffer uploads: any alignment
* Buffer uploads with an offset: 256-byte alignment
* WGSL accesses of e.g. buffer struct fields: any alignment
* Buffer downloads (calls to `getMappedRange(T, ...)`) return pointers from the underlying GPU API, generally it is required that `@alignOf(T) == 16`. See also [hexops/mach#847](https://github.com/hexops/mach/issues/847) and [webgpu-headers#180](https://github.com/webgpu-native/webgpu-headers/issues/180).
