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
    <span>
        <a href="https://github.com/hexops/mach-earcut">GitHub repository</a> | <a href="https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Aearcut">Issue tracker</a>
    </span>
</div>

Industrial-strength polygon triangulation for Zig 

## Experimental

This is an **experimental** project according to [our stability guarantees](../../about/stability):

> When a project has an experimental warning, it means all bets are off. You should carefully read the warning to understand why the project is experimental, and assume the worst.

**Tracking issue:** https://github.com/hexops/mach/issues/967

## Background

Turning polygons into triangle meshes is a challenging problem, with numerous edge-cases. Popular libraries that try to solve this problem include libtess2, libtess3, and poly2tri (including the MetricPanda poly2tri variant.) Some of these libraries are better than others, but all of them suffer from performance and correctness issues, often failing on very simple polygon inputs.

State-of-the-art research into polygon tesselation includes [CMU researcher Jonathan Shewchuk's outstanding 'Triangle' library](https://www.cs.cmu.edu/~quake/triangle.html), which is probably the most industrial-strength and correct polygon tesselator in existence today. Despite widespread adoption in some open source projects, [it is in fact proprietary](https://gist.github.com/slimsag/7e38961c7f9dfc2dcf8eea17b41f919e) and not legally suitable for inclusion in open source software.

The second most industrial-strength tesselation library in existence today is from [a company called Mapbox](https://github.com/mapbox/earcut), and is [at the core of their map rendering](https://docs.mapbox.com/mapbox-gl-js/example/) technology. `mach/earcut` is a port of their library to Zig: it is open-source and permissively licensed, and based on ideas from [FIST: Fast Industrial-Strength Triangulation of Polygons](http://www.cosy.sbg.ac.at/~held/projects/triang/triang.html) by Martin Held and [Triangulation by Ear Clipping](http://www.geometrictools.com/Documentation/TriangulationByEarClipping.pdf) by David Eberly - and optimized by [z-order curve](http://en.wikipedia.org/wiki/Z-order_curve) hashing.

It can handle holes, twisted polygons, degeneracies and self-intersections. While it doesn't _guarantee_ correctness of triangulation, it attempts to always produce acceptable results for practical data. In effect, it is good for *turning polygons into triangles for visualization*.

It is [faster and more correct](https://github.com/mapbox/earcut#why-another-triangulation-library) than other libraries such as libtess, poly2tri, and others. But it's not perfect, either.

This Zig implementation is a direct port, and should theoretically be equally correct - and possibly faster than the mapbox version.

### Version

We currently reflect [this version](https://github.com/mapbox/earcut/tree/ae33a9fc9731c76519e66081995387e08d48eb65) of the upstream library.

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

Run `zig build` in your project, and the compiler will instruct you to add a `.hash = "..."` field next to `.url`:

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

For usage, see [test "basic"](https://github.com/hexops/mach-earcut/blob/main/src/main.zig#L742-L770)

### Ran into trouble?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.
