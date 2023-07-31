---
title: "GPU overview"
description: "Mach uses WebGPU as its graphics API, this is an overview of that, links to learning resources and more information about how to use it."
draft: false
layout: "docs"
docs_type: "engine"
rss_ignore: true
---

# GPU overview

Mach uses WebGPU as its graphics API, this is an overview of that, links to learning resources and more information about how to use it.

## Learning resources

### Things to reference as you go

* [webgpu.rocks WGSL guide](https://webgpu.rocks/wgsl/language/types/)
* [WebGPU specification](https://www.w3.org/TR/webgpu/) and [WGSL specification](https://www.w3.org/TR/WGSL/).

### Video tutorials

[@GetIntoGameDev has an excellent series](https://www.youtube.com/watch?v=UBqme9A_O3c&list=PLn3eTxaOtL2Ns3wkxdyS3CiqkJuwQdZzn) of around 30 "WebGPU for Beginners" tutorials, they are using JavaScript but the APIs and concepts are the same. They go into an interesting raytracing-using-compute-shaders technique towards the end.

### Code examples

* [mach-core](../../core#example-showcase) has an example showcase with 15+ Zig examples.
* JS examples: https://github.com/webgpu/webgpu-samples
* C examples: https://github.com/samdauwe/webgpu-native-examples

### Articles

* [Buffers uploads](https://toji.dev/webgpu-best-practices/buffer-uploads.html) by @tojiro
* [WebGPU GLTF case study](https://toji.github.io/webgpu-gltf-case-study/) by @tojiro
* [Using WebGPU Compute Shaders with Vertex Data](https://toji.dev/webgpu-best-practices/compute-vertex-data) (compute skinning) - by @tojiro
* ["Raw WebGPU"](https://alain.xyz/blog/raw-webgpu#initialize-api) has great diagrams of the basic concepts behind WebGPU - by @alain
* [Surma.dev's article](https://surma.dev/things/webgpu/) covers WebGPU compute shaders in detail
