---
title: "mach sysaudio"
description: "Truly cross-platform, low-level, audio IO in Zig - input and output with minimal latency and a friendly API."
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div style="display: flex; flex-direction: column; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/sysaudio-full-dark.svg">
        <img alt="mach-sysaudio" src="/assets/mach/sysaudio-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <a href="https://github.com/hexops/mach-sysaudio">GitHub repository</a>
</div>

Truly cross-platform, low-level, audio IO in Zig - input and output with minimal latency and a friendly API.

## Getting started

Create a `build.zig.zon` in your project (replace `LATEST_COMMIT` with the latest commit hash):

```zig
.{
    .name = "mypkg",
    .version = "0.1.0",
    .dependencies = .{
        .mach_sysaudio = .{
            .url = "https://pkg.machengine.org/mach-sysaudio/LATEST_COMMIT.tar.gz",
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
    exe.addModule("mach-sysaudio", b.dependency("mach_sysaudio", .{
        .target = target,
        .optimize = optimize,
    }).module("mach-sysaudio"));
}
```

You can now use it in your `src/main.zig` file:

```zig
const sysaudio = @import("mach-sysaudio");
```

### Issues? Questions?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.
