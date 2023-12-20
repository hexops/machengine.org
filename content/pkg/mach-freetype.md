---
title: "mach freetype"
description: "Ziggified Freetype 2 bindings with zero-fuss installation, cross compilation, and more."
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div class="centered">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/freetype-full-dark.svg">
        <img alt="mach-freetype" src="/assets/mach/freetype-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <span>
        <a href="https://github.com/hexops/mach-freetype">GitHub repository</a> | <a href="https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Afreetype">Issue tracker</a>
    </span>
</div>

Ziggified Freetype 2 bindings with zero-fuss installation, cross compilation, and more.

* [Zero-fuss](../../about/goals#zero-fuss-installation) installation, [cross-compilation](../../about/goals#seamless-cross-compilation) at the flip of a switch, and [broad platform support](../../about/platforms).
* Very good API coverage, almost every function, type, constant, etc. has been exposed in a ziggified API.

## Getting started

Create a `build.zig.zon` in your project (replace `LATEST_COMMIT` with the latest commit hash):

```zig
.{
    .name = "mypkg",
    .version = "0.1.0",
    .dependencies = .{
        .mach_freetype = .{
            .url = "https://pkg.machengine.org/mach-freetype/LATEST_COMMIT.tar.gz",
        },
    },
}
```

Run `zig build` in your project, and the compiler will instruct you to add a `.hash = "..."` field next to `.url`:

```
note: expected .hash = "12209838fcfb7a77d2d6931efdc7448c033a1b7dad11d082c94bbeeba9d1038cd311",
```

Next, use the dependency in your `build.zig`:

```zig
const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "tmp",
        // In this case the main source file is merely a path, however, in more
        // complicated build scripts, this could be a generated file.
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    exe.addModule("font-assets", b.dependency("font_assets", .{}).module("font-assets"));

    // Use mach-freetype
    const mach_freetype_dep = b.dependency("mach_freetype", .{
        .target = target,
        .optimize = optimize,
    });
    exe.addModule("mach-freetype", mach_freetype_dep.module("mach-freetype"));
    exe.addModule("mach-harfbuzz", mach_freetype_dep.module("mach-harfbuzz"));
    @import("mach_freetype").linkFreetype(mach_freetype_dep.builder, exe);
    @import("mach_freetype").linkHarfbuzz(mach_freetype_dep.builder, exe);

    b.installArtifact(exe);
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
```

You can now use it in your `src/main.zig` file:

```zig
const freetype = @import("mach-freetype");
const harfbuzz = @import("mach-harfbuzz");
```

### Ran into trouble?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.
