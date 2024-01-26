---
title: "mach flac"
description: "FLAC audio decoding and encoding for Zig via the battle-hardened xiph.org libflac "
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div class="centered">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/flac-full-dark.svg">
        <img alt="mach-flac" src="/assets/mach/flac-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <span>
        <a href="https://github.com/hexops/mach-flac">GitHub repository</a> | <a href="https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Aflac">Issue tracker</a>
    </span>
</div>

FLAC audio decoding and encoding for Zig via the battle-hardened xiph.org libflac

* [Zero-fuss](../../about/goals#zero-fuss-installation) installation, [cross-compilation](../../about/goals#seamless-cross-compilation) at the flip of a switch, and [broad platform support](../../about/platforms).
* Encoding & decoding support

## Experimental

This is an **experimental** project according to [our stability guarantees](../../about/stability):

> When a project has an experimental warning, it means all bets are off. You should carefully read the warning to understand why the project is experimental, and assume the worst.

**Tracking issue:** https://github.com/hexops/mach/issues/959

## Getting started

Create a `build.zig.zon` in your project (replace `LATEST_COMMIT` with the latest commit hash):

```zig
.{
    .name = "mypkg",
    .version = "0.1.0",
    .dependencies = .{
        .mach_flac = .{
            .url = "https://pkg.machengine.org/mach-flac/LATEST_COMMIT.tar.gz",
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
    exe.root_module.addImport("mach-flac", b.dependency("mach_flac", .{
        .target = target,
        .optimize = optimize,
    }).module("mach-flac"));
}
```

You can now use it in your `src/main.zig` file:

```zig
const flac = @import("mach-flac");
```

See [here](https://github.com/hexops/mach-flac/tree/main/examples) for example code.

### Ran into trouble?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.
