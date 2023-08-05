---
title: "mach freetype"
description: "Ziggified Freetype 2 bindings with zero-fuss installation, cross compilation, and more."
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div style="display: flex; flex-direction: column; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/freetype-full-dark.svg">
        <img alt="mach-freetype" src="/assets/mach/freetype-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <a href="https://github.com/hexops/mach-freetype">GitHub repository</a>
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

Run `zig build` in your project, and the compiler instruct you to add a `.hash = "..."` field next to `.url`:

```
note: expected .hash = "12209838fcfb7a77d2d6931efdc7448c033a1b7dad11d082c94bbeeba9d1038cd311",
```

Then copy+paste the `.freetype`, `.brotli` and `.harfbuzz` dependencies from the [mach-freetype build.zig.zon](https://github.com/hexops/mach-freetype/blob/main/build.zig.zon) into your `build.zig.zon` as well.

Next, use the dependency in your `build.zig`:

```zig
const mach_freetype_dep = b.dependency("mach_freetype", .{
    .target = target,
    .optimize = optimize,
});
const freetype_dep = b.dependency("mach_freetype.freetype", .{
    .target = target,
    .optimize = optimize,
});
const harfbuzz_dep = b.dependency("mach_freetype.harfbuzz", .{
    .target = target,
    .optimize = optimize,
});
const brotli_dep = b.dependency("mach_freetype.freetype.brotli", .{
    .target = target,
    .optimize = optimize,
});

pub fn build(b: *std.Build) void {
    ...

    // Use mach-freetype
    exe.addModule("mach-freetype", mach_freetype_dep.module("mach-freetype"));
    exe.addModule("mach-harfbuzz", mach_freetype_dep.module("mach-harfbuzz"));
    exe.linkLibrary(freetype_dep.artifact("freetype"));
    exe.linkLibrary(harfbuzz_dep.artifact("harfbuzz"));
    exe.linkLibrary(brotli_dep.artifact("brotli"));
}
```

You can now use it in your `src/main.zig` file:

```zig
const freetype = @import("mach-freetype");
const harfbuzz = @import("mach-harfbuzz");
```

### Issues? Questions?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.
