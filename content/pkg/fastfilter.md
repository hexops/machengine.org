---
title: "fastfilter"
description: "Binary fuse & xor filters for Zig (faster and smaller than bloom filters)"
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

# fastfilter

Binary fuse & xor filters for Zig (faster and smaller than bloom filters)

<div style="display: flex; flex-direction: column; justify-content: space-between; align-items: left; margin-bottom: 1rem;">
    <a href="/img/fastfilter.png"><img src="/img/fastfilter.png" style="width: 20rem; margin-top: 1rem;"></a>
    <span>
        <a href="https://github.com/hexops/fastfilter">GitHub repository</a> | <a href="https://github.com/hexops/fastfilter/issues">Issue tracker</a>
    </span>
</div>

## Getting started

Create a `build.zig.zon` in your project (replace `LATEST_COMMIT` with the latest commit hash):

```zig
.{
    .name = "mypkg",
    .version = "0.1.0",
    .dependencies = .{
        .fastfilter = .{
            .url = "https://pkg.machengine.org/fastfilter/LATEST_COMMIT.tar.gz",
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
    exe.addModule("fastfilter", b.dependency("fastfilter", .{
        .target = target,
        .optimize = optimize,
    }).module("fastfilter"));
}
```

You can now use it in your `src/main.zig` file:

```zig
const earcut = @import("fastfilter");
```

### Ran into trouble?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.
