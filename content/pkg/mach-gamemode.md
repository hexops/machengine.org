---
title: "mach gamemode"
description: "Make your Linux games go brrr"
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div style="display: flex; flex-direction: column; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/gamemode-full-dark.svg">
        <img alt="mach-gamemode" src="/assets/mach/gamemode-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <span>
        <a href="https://github.com/hexops/mach-gamemode">GitHub repository</a> | <a href="https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Agamemode">Issue tracker</a>
    </span>
</div>

Make your Linux games go brrr

Enables Linux games written in Zig to _request [gamemode](https://github.com/FeralInteractive/gamemode) be enabled_, opting in to various CPU, GPU, and kernel optimizations. If the user's machine doesn't have gamemode, it simply does nothing. There are no dependencies and your game will still run without it normally.

This is preferred as it means your game will automatically invoke gamemode for the user when running, rather than them having to manually enable it.

## What is Linux GameMode?

Used by titles such as DiRT 4, many Tomb Raider and Total War games, [GameMode](https://github.com/FeralInteractive/gamemode) is a daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS and/or a game process, including:

>     CPU governor
>     I/O priority
>     Process niceness
>     Kernel scheduler (SCHED_ISO)
>     Screensaver inhibiting
>     GPU performance mode (NVIDIA and AMD), GPU overclocking (NVIDIA)
>     Custom scripts

GameMode packages are available for Ubuntu, Debian, Solus, Arch, Gentoo, Fedora, OpenSUSE, Mageia and possibly more.

## Getting started

Create a `build.zig.zon` in your project (replace `LATEST_COMMIT` with the latest commit hash):

```zig
.{
    .name = "mypkg",
    .version = "0.1.0",
    .dependencies = .{
        .mach_gamemode = .{
            .url = "https://pkg.machengine.org/mach-gamemode/LATEST_COMMIT.tar.gz",
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
    exe.addModule("mach-gamemode", b.dependency("mach_gamemode", .{
        .target = target,
        .optimize = optimize,
    }).module("mach-gamemode"));
}
```

You can now use it in your `src/main.zig` file and use it:

```zig
const gamemode = @import("mach-gamemode");
```

### Usage

The API is incredibly simple, when you want to start/stop gamemode simply call the function:

```
gamemode.start();
gamemode.stop();
```

No errors are returned; mach-gamemode generally stays silent. If users don't have gamemode, or the platform is not linux, then nothing happens. Only if you have gamemode will it be enabled.

One can check programatically if gamemode is active using `gamemode.isActive()`.

### Ran into trouble?

Triple-check you followed the `build.zig.zon` instructions correctly, it's easy to mess that part up.

Feel free to join the [Mach Discord community](../../discord) for help.
