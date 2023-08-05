---
title: "mach gamemode"
description: "Make your Linux games go brrr"
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div style="display: flex; flex-direction: column; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/gamemode-full-dark.svg">
        <img alt="mach-gamemode" src="/assets/mach/gamemode-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <a href="https://github.com/hexops/mach-gamemode">GitHub repository</a>
</div>

Make your Linux games go brrr

## Getting started

Create a `build.zig.zon` in your project (replace `LATEST_COMMIT` with the latest commit hash):

```zig
.{
    .name = "mypkg",
    .version = "0.1.0",
    .dependencies = .{
        .mach_gamemode = .{
            .url = "https://pkg.machengine.org/mach-gamemode/LATEST_COMMIT.tar.gz",
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
    exe.addModule("mach-gamemode", b.dependency("mach_gamemode", .{
        .target = target,
        .optimize = optimize,
    }).module("mach-gamemode"));
}
```

You can now use it in your `src/main.zig` file:

```zig
const gamemode = @import("mach-gamemode");
```

### Issues? Questions?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.