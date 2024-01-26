---
title: "mach basisu"
description: "basis universal (supercompressed textures) for Zig"
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div class="centered">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/basisu-full-dark.svg">
        <img alt="mach-basisu" src="/assets/mach/basisu-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <span>
        <a href="https://github.com/hexops/mach-basisu">GitHub repository</a> | <a href="https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Abasisu">Issue tracker</a>
    </span>
</div>

basis universal (supercompressed textures) for Zig

## Experimental

This is an **experimental** project according to [our stability guarantees](../../about/stability):

> When a project has an experimental warning, it means all bets are off. You should carefully read the warning to understand why the project is experimental, and assume the worst.

**Tracking issue:** https://github.com/hexops/mach/issues/965

## Getting started

Create a `build.zig.zon` in your project (replace `LATEST_COMMIT` with the latest commit hash):

```zig
.{
    .name = "mypkg",
    .version = "0.1.0",
    .dependencies = .{
        .mach_basisu = .{
            .url = "https://pkg.machengine.org/mach-basisu/LATEST_COMMIT.tar.gz",
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
    exe.root_module.addImport("mach-basisu", b.dependency("mach_basisu", .{
        .target = target,
        .optimize = optimize,
    }).module("mach-basisu"));
}
```

You can now use it in your `src/main.zig` file:

```zig
const basisu = @import("mach-basisu");
```

See [this test](https://github.com/hexops/mach-basisu/blob/main/src/main.zig#L22-L47) for usage.

### Ran into trouble?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.
