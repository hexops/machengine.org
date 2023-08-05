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
    <a href="https://github.com/hexops/mach-gpu-dawn">GitHub repository</a>
</div>

Google's Dawn WebGPU implementation, cross-compiled with Zig into a single static library 

## Getting started

Create a `build.zig.zon` in your project (replace `LATEST_COMMIT` with the latest commit hash):

```zig
.{
    .name = "mypkg",
    .version = "0.1.0",
    .dependencies = .{
        .mach_gpu_dawn = .{
            .url = "https://pkg.machengine.org/mach-gpu-dawn/LATEST_COMMIT.tar.gz",
        },
    },
}
```

Run `zig build` in your project, and the compiler instruct you to add a `.hash = "..."` field next to `.url`:

```
note: expected .hash = "12209838fcfb7a77d2d6931efdc7448c033a1b7dad11d082c94bbeeba9d1038cd311",
```

Then use the dependency in your `build.zig`:

```zig
pub fn build(b: *std.Build) void {
    ...
    exe.addModule("mach_gpu_dawn", b.dependency("mach_gpu_dawn", .{
        .target = target,
        .optimize = optimize,
    }).module("mach-gpu-dawn"));
}
```

You can now use it in your `src/main.zig` file:

```zig
const gpu_dawn = @import("mach-gpu-dawn");
```

### Issues? Questions?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.
