---
title: "mach earcut"
description: "Industrial-strength polygon triangulation for Zig "
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div style="display: flex; flex-direction: column; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/earcut-full-dark.svg">
        <img alt="mach-earcut" src="/assets/mach/earcut-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <a href="https://github.com/hexops/mach-earcut">GitHub repository</a>
</div>

Industrial-strength polygon triangulation for Zig 

## Experimental

This is an **experimental** project according to [our stability guarantees](../../about/stability):

> When a project has an experimental warning, it means all bets are off. You should carefully read the warning to understand why the project is experimental, and assume the worst.

**Status:** This is a port of mapbox/earcut, it should work well and matches the upstream implementation 1:1 but is not well-tested. If issues are found, our ability to resolve them will be limited.

## Getting started

Create a `build.zig.zon` in your project (replace `LATEST_COMMIT` with the latest commit hash):

```zig
.{
    .name = "mypkg",
    .version = "0.1.0",
    .dependencies = .{
        .mach_earcut = .{
            .url = "https://pkg.machengine.org/mach-earcut/LATEST_COMMIT.tar.gz",
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
    exe.addModule("mach-earcut", b.dependency("mach_earcut", .{
        .target = target,
        .optimize = optimize,
    }).module("mach-earcut"));
}
```

You can now use it in your `src/main.zig` file:

```zig
const earcut = @import("mach-earcut");
```

### Issues? Questions?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.
