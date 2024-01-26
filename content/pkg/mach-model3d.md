---
title: "mach model3d"
description: "Compact, featureful model format & alternative to glTF."
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div class="centered">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/model3d-full-dark.svg">
        <img alt="mach-model3d" src="/assets/mach/model3d-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <span>
        <a href="https://github.com/hexops/mach-model3d">GitHub repository</a> | <a href="https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Amodel3d">Issue tracker</a>
    </span>
</div>

Compact, featureful model format & alternative to glTF.

[Model3D](https://gitlab.com/bztsrc/model3d/) is an up-and-coming compact, featureful, universal model format that tries to address the shortcomings of existing formats (yes, including glTF - see [their rationale](https://gitlab.com/bztsrc/model3d/#rationale).)

## Experimental

This is an **experimental** project according to [our stability guarantees](../../about/stability):

> When a project has an experimental warning, it means all bets are off. You should carefully read the warning to understand why the project is experimental, and assume the worst.

**Tracking issue:** https://github.com/hexops/mach/issues/969

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

Run `zig build` in your project, and the compiler will instruct you to add a `.hash = "..."` field next to `.url`:

```
note: expected .hash = "12209838fcfb7a77d2d6931efdc7448c033a1b7dad11d082c94bbeeba9d1038cd311",
```

Then use the dependency in your `build.zig`:

```zig
pub fn build(b: *std.Build) void {
    ...
    exe.root_module.addImport("mach-model3d", b.dependency("mach_model3d", .{
        .target = target,
        .optimize = optimize,
    }).module("mach-model3d"));
}
```

You can now use it in your `src/main.zig` file:

```zig
const model3d = @import("mach-model3d");
```

For usage examples, you can look at the mach-core [pbr-basic example](https://github.com/hexops/mach-core/blob/main/examples/pbr-basic/main.zig) - note that a `vertex_writer.zig` helper is needed due to the way model3d stores data.

### Ran into trouble?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.
