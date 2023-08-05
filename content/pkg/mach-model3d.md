---
title: "mach model3d"
description: "Compact, featureful model format & alternative to glTF."
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div style="display: flex; flex-direction: column; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/model3d-full-dark.svg">
        <img alt="mach-model3d" src="/assets/mach/model3d-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <a href="https://github.com/hexops/mach-model3d">GitHub repository</a>
</div>

Compact, featureful model format & alternative to glTF.

## Experimental

This is an **experimental** project according to [our stability guarantees](../../about/stability):

> When a project has an experimental warning, it means all bets are off. You should carefully read the warning to understand why the project is experimental, and assume the worst.

**Status:** Ready for use, but docs are not great. We're considering if model3d is the right format for Mach.

## Getting started

Create a `build.zig.zon` in your project (replace `LATEST_COMMIT` with the latest commit hash):

```zig
.{
    .name = "mypkg",
    .version = "0.1.0",
    .dependencies = .{
        .mach_model3d = .{
            .url = "https://pkg.machengine.org/mach-model3d/LATEST_COMMIT.tar.gz",
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
    exe.addModule("mach_model3d", b.dependency("mach_model3d", .{
        .target = target,
        .optimize = optimize,
    }).module("mach-model3d"));
}
```

You can now use it in your `src/main.zig` file:

```zig
const model3d = @import("mach-model3d");
```

### Issues? Questions?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.
