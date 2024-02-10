---
title: "mach dxcompiler"
description: "The DirectX shader compiler, built better."
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

# mach-dxcompiler
<h4 style="margin-top: 0; margin-bottom: 1rem;">The DirectX shader compiler, built better.</h4>
<span>
    <a href="https://github.com/hexops/mach-glfw">GitHub repository</a> | <a href="https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Aglfw">Issue tracker</a>
</span>

See ['Building the DirectX shader compiler better than Microsoft?'](https://devlog.hexops.com/2024/building-the-directx-shader-compiler-better-than-microsoft/) for details/background information.

## Features

* Statically linked `dxcompiler` library and `dxc` executables.
* Zero dependency on proprietary `dxil.dll` code-signing blob (see: [Mach Siegbert Vogt DXCSA](https://github.com/hexops/DirectXShaderCompiler/blob/4190bb0c90d374c6b4d0b0f2c7b45b604eda24b6/tools/clang/tools/dxcompiler/MachSiegbertVogtDXCSA.cpp#L178))
* Built using `build.zig` instead of 10k+ LOC CMake build system.
* [Prebuilt binaries](https://github.com/hexops/mach-dxcompiler/releases) provided for many OS/arch.
* Binaries for macOS and aarch64 Linux (first ever in history), among others.
* [Simple C API](https://github.com/hexops/mach-dxcompiler/blob/main/src/mach_dxc.h) bundled into library as an alternative to the traditional COM API.

## Building from source

Specify the `-Dfrom_source` build option to produce a build from source (the default is to fetch a prebuilt binary produced from our CI pipelines):

```
zig build -Dfrom_source -Doptimize=ReleaseFast -Dtarget=aarch64-macos
zig build -Dfrom_source -Doptimize=ReleaseFast -Dtarget=x86_64-windows-gnu -Dcpu=x86_64_v2
zig build -Dfrom_source -Doptimize=ReleaseFast -Dtarget=x86_64-linux-gnu -Dcpu=x86_64_v2
```

## Getting started (Zig package)

First `zig init` to create a new Zig project. Then add the dependency (change `LATEST_COMMIT` to the actual latest commit hash from the repository):

```sh
zig fetch --save https://pkg.machengine.org/mach-dxcompiler/LATEST_COMMIT.tar.gz
```

Then in your `build.zig` file make the module importable in your code using e.g.:

```zig
    const dxcompiler_dep = b.dependency("mach_dxcompiler", .{
        .target = target,
        .optimize = ReleaseFast, // use an optimized compiler
        .from_source = false, // use a prebuilt binary
    });
    exe.root_module.addImport("mach-dxcompiler", dxcompiler_dep.module("mach-dxcompiler"));
```

For usage, see `src/main.zig` tests in the repository.

### Ran into trouble?

Feel free to join the [Mach Discord community](../../discord) for help.

