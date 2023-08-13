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
    <span>
        <a href="https://github.com/hexops/mach-sysaudio">GitHub repository</a> | <a href="https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Asysaudio">Issue tracker</a>
    </span>
</div>

Truly cross-platform, low-level, audio IO in Zig - playback and recording with backends for:

* Linux
  * PulseAudio
  * PipeWire
  * Jack
  * ALSA
* Windows: WASAPI
* macOS/iOS: CoreAudio
* WebAssembly: WebAudio

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
        .mach_sysjs = .{
            .url = "https://pkg.machengine.org/mach-sysjs/LATEST_COMMIT.tar.gz",
        },
        .linux_audio_headers = .{
            .url = "https://pkg.machengine.org/linux-audio-headers/LATEST_COMMIT.tar.gz",
        },
        .xcode_frameworks = .{
            .url = "https://github.com/hexops/xcode-frameworks-pkg/archive/LATEST_COMMIT.tar.gz",
        },
    },
}
```

Run `zig build` in your project, and the compiler will instruct you to add a `.hash = "..."` fields next to `.url`:

```
note: expected .hash = "12209838fcfb7a77d2d6931efdc7448c033a1b7dad11d082c94bbeeba9d1038cd311",
```

Then use the dependency in your `build.zig`:

```zig
const mach_sysaudio = @import("mach_sysaudio");

pub fn build(b: *std.Build) void {
    ...
    exe.addModule("mach-sysaudio", mach_sysaudio.module(b, optimize, target));
    mach_sysaudio.link(b, exe);
}
```

You can now use it in your `src/main.zig` file:

```zig
const sysaudio = @import("mach-sysaudio");
```

See [here](https://github.com/hexops/mach-sysaudio/tree/main/examples) for example code.

### Ran into trouble?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.
