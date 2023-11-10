---
title: "Standard library"
description: "The Mach standard library is modular by design, and you can use portions of it as e.g. standalone libraries as you like."
draft: false
layout: "docs"
docs_type: "engine"
rss_ignore: true
---

# Standard library

The Mach standard library can be found at: [github.com/hexops/mach](https://github.com/hexops/mach) - it is [modular by design](../modularity) and you may choose to use depend on all of it, or just some of it.

## Using mach.math as a separate library

Let's take for example `mach.math`, our math library. Unlike other gamedev math libraries which may try to support a bunch of different coordinate systems in order to support various graphics APIs, ours is specifically for Mach's design goals. For example:

* It only exposes projection matrices that map into a clip space of `[0, 1]`, and doesn't expose options for e.g. OpenGL which uses `[-1, 1]`
* It only speaks of a `+Y up, left-handed` coordinate system because that's what Mach uses.

If you want to use `mach.math` as a standalone library, without the rest of Mach, that's perfect doable!

## Getting started

Create a `build.zig.zon` in your project (replace `LATEST_COMMIT` with the latest commit hash):

```zig
.{
    .name = "mypkg",
    .version = "0.1.0",
    .dependencies = .{
        .mach = .{
            .url = "https://pkg.machengine.org/mach/LATEST_COMMIT.tar.gz",
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
    exe.addModule("mach", b.dependency("mach", .{
        .target = target,
        .optimize = optimize,
    }).module("mach"));
}
```

Now in your `src/main.zig` file you can use the Mach standard library:

```zig
const std = @import("std");
const mach = @import("mach");

pub fn main() !void {
    const v = mach.math.vec3(0, 0, 0).mulScalar(2);
    std.debug.print("All your {} are belong to us.\n", .{v});
}
```

## Zig's lazy code evaluation

You might notice we're importing the _entire_ Mach standard library above:

```
const mach = @import("mach");
```

Unlike in other languages where this would mean you are compiling _all the code that is in there_, Zig has lazy code evaluation which means that if you are only using it for `mach.math` you are really only paying for that code.

We also keep our standard library repository intentionally small, select, and free of any binary assets or things that could bloat the dependency download, specifically to suite this 'using just a part of it' use-case.

In effect, if you only use the standard library just for `mach.math`, you're effectively paying no penalty.

## Ran into trouble?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.
