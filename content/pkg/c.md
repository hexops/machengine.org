---
title: "C packages"
description: "Mach provides an ecosystem of C libraries via the Zig package manager. These aren't Zig bindings, but rather just projects built using build.zig"
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

# C libraries & headers packaged via the Zig build system

Mach provides an ecosystem of C libraries via the Zig package manager.

**_These aren’t Zig bindings_** to these libraries (which we have separately), but instead are just forks of the actual project with their build system replaced by `build.zig` so you can depend on them and build them using the Zig package manager.

Pure forks with build.zig:

* [brotli](https://github.com/hexops/brotli)
* [harfbuzz](https://github.com/hexops/harfbuzz)
* [freetype](https://github.com/hexops/freetype)
* [glfw](https://github.com/hexops/glfw)
* [basisu](https://github.com/hexops/basisu)
* [opus](https://github.com/hexops/opus)
* [opusfile](https://github.com/hexops/opusfile)
* [opusenc](https://github.com/hexops/opusenc)
* [flac](https://github.com/hexops/flac)
* [ogg](https://github.com/hexops/ogg)
* [spirv-tools](https://github.com/hexops/spirv-tools)
* [spirv-cross](https://github.com/hexops/spirv-cross)

Header packages:

* [direct3d-headers](https://github.com/hexops/direct3d-headers)
* [wayland-headers](https://github.com/hexops/wayland-headers)
* [x11-headers](https://github.com/hexops/x11-headers)
* [vulkan-headers](https://github.com/hexops/vulkan-headers)
* [opengl-headers](https://github.com/hexops/opengl-headers)
* [linux-audio-headers](https://github.com/hexops/linux-audio-headers)

Special cases:

* [vulkan-zig-generated](https://github.com/hexops/vulkan-zig-generated) pre-generated Vulkan bindings
* [mach-objc](https://github.com/hexops/mach-objc) Objective C API bindings
* [xcode-frameworks](https://github.com/hexops/xcode-frameworks) macOS XCode frameworks
* [dawn](https://github.com/hexops/dawn) (wrench-generated source branches with vendored dependency tree)
* [DirectXShaderCompilerwn](https://github.com/hexops/DirectXShaderCompiler) (fork for Zig compilation support)
