---
title: "mach-freetype: Ziggified FreeType 2 bindings"
description: "Zig bindings to Freetype 2 core API, HarfBuzz, with optional brotli/woff2 support."
draft: false
layout: "docs"
docs_type: "libs"
rss_ignore: true
images: ["/img/mach-opengraph.png"]
---

Zig bindings to FreeType and HarfBuzz, featuring:

* 99% FreeType 2 core API coverage.
* (optional) HarfBuzz bindings, which is critical for proper Unicode rendering.
* (optional) brotli support for woff2 fonts
* (optional) external zlib linkage


# Ziggified FreeType 2 bindings

<div style="margin-top: 2rem;">
    <a href="https://github.com/hexops/mach-freetype" class="img-link" style="float: right; padding-left: 1rem;">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/freetype-dark.svg">
            <img alt="mach-freetype" src="/assets/mach/freetype-light.svg" style="width: 20rem; margin-right: 1rem; margin-top: 0.5rem;">
        </picture>
    </a>
    As with all Mach libraries, <a href="../../about/goals#zero-fuss-installation">zero-fuss installation</a>, <a href="../../about/goals#seamless-cross-compilation">cross-compilation</a> at the flip of a switch, and <a href="../../about/goals#platform-support">broad platform support</a> is guaranteed.
    <br/>
    <br/>
    <span style="font-family: Orbitron;"><em>Quick links:</em></span>
    <br/>
    <ul style="display: inline-block;">
        <li><a href="https://github.com/hexops/mach-freetype">mach-freetype on GitHub</a></li>
    </ul>
</div>

## Features

Zig bindings to FreeType and HarfBuzz, featuring:

* 99% FreeType 2 core API coverage.
* (optional) HarfBuzz bindings, which is critical for proper Unicode rendering.
* (optional) brotli support for woff2 fonts
* (optional) external zlib linkage

## Examples

Two [examples](https://github.com/hexops/mach-freetype/tree/main/examples) are provided:

1. `glyph-to-svg`: converts a single glyph into an SVG file.
2. `single-glyph`: decomposes a single glyph and renders it as ASCIi in your terminal.

Examples can be ran via:

```sh
zig build run-example-glyph-to-svg
zig build run-example-single-glyph
```

## Getting started

### Adding dependency

In a `libs` subdirectory of the root of your project:

```sh
git clone https://github.com/hexops/mach-freetype
```

Then in your `build.zig` add:

```zig
...
const freetype = @import("libs/mach-freetype/build.zig");

pub fn build(b: *Builder) void {
    ...
    exe.addPackage(freetype.pkg(b));
    freetype.link(b, exe, .{});

    // use this option if you are including zlib separately
    //freetype.link(b, exe, .{ .freetype = .{ .use_system_zlib = true } });
}
```

and optionaly add harfbuzz:

```zig
exe.addPackage(freetype.harfbuzz_pkg);
freetype.link(b, exe, .{ .harfbuzz = .{} });
```

You can also optionally build brotli compression (for WOFF2 font support):

```zig
    exe.addPackage(freetype.pkg(b));
    freetype.link(b, exe, .{ .freetype = .{ .brotli = true } });
```

Now you can import in code:

```zig
const freetype = @import("freetype");
```
