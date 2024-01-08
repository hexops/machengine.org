---
title: "Nominated Zig versions"
description: "Periodically we nominate a new nightly Zig version for use, providing a better balance of recent Zig improvements and stability."
draft: false
layout: "docs"
docs_type: "about"
rss_ignore: true
---

# Nominated Zig versions

Periodically we nominate a new Zig nightly version which all Mach projects target and use.

We encourage others to adopt the same Zig version Mach uses, since Zig packages which target latest nightly (or the latest stable release) will very often be incompatible otherwise.

## Why Mach' nominated Zig versions, instead of nightly or stable?

**TL;DR: it's a sweetspot between stable and nightly.**

Stable releases occur just once or twice per year, Mach' nominated Zig versions occur several times per year - but not every day like nightly.

Stable releases of Zig are few and far between, perhaps once or twice per year, making it challenging to provide feedback on the latest-and-greatest APIs or benefit from the wins that are being made in `main` because Zig development happens so rapidly.

Nightly Zig is the opposite, but is an always moving target. When only you work with your code, you depend on nobody, and nobody depends on you, then you can update at your leisure and nightly is managable. But with many projects depending on one another, it's very challenging to ensure your code is compatible with others' because everyone is working on their own personal update schedule.

Mach's nominated Zig versions provide a different set of tradeoffs, a middleground between the two extremes above: benefit from the changes in nightly Zig 2-3x faster than you would using stable, and suffer less from the incompatibility consequences of using nightly.

## Schedule

| When      | What                    | 🚀 Other notable event                             |
|-----------|-------------------------|----------------------------------------------------|
| January   |                         | 🚀 Mach version release                            |
| February  |                         | 👋 Anticipated influx of new Machanists / Ziguanas |
| March     | ⚡ Zig version nominated |                                                    |
| April     |                         |                                                    |
| May       | ⚡ Zig version nominated |                                                    |
| June      | ⚡ Zig version nominated |                                                    |
| July      |                         | 🚀 Mach version release                            |
| August    |                         | 👋 Anticipated influx of new Machanists / Ziguanas |
| September | ⚡ Zig version nominated |                                                    |
| October   |                         |                                                    |
| November  | ⚡ Zig version nominated |                                                    |
| December  |                         | 👋 Anticipated influx of new Machanists / Ziguanas |

All events target the 4th day of the month, but may slip if we're unable to complete the event by then.

Over time, we may adjust this schedule somewhat as we learn more (it is not set in stone.)

## Process

During months where a Zig version is nominated, we:

* _Begin_ the nomination process (ideally on the 1st-4th of the month)
* Update the _Nomination history_ section below with the new nightly Zig version we're nominating.
* Begin the time-consuming process of following [this GitHub checklist](https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Azig-update)
  * Updating 40+ repositories Zig code, CI pipelines, build.zig.zon files, testing using the new Zig version, etc.
  * Doing updates in a specific order, so that dependencies are also updated to use the new Zig version
* Typically, a show-stopping bug does not occur. But if it does..
  * We may have to fix the issue e.g. upstream in Zig if we can't workaround it
  * We'll need to wait for it to be merged, and for Zig nightly builds to contain the fix
  * We'll update the _existing Nomination history entry_ to point to the new version (days may have passed, so this could include other breaking changes)
  * Re-roll! Effectively begin this whole process from the beginning.
* Once everything looks good, the new Zig version is working with Mach, we declare success - the GitHub issue is closed, and an announcement is made in the #progress channel of Discord.
* If after we declare success you find a show-stopping bug in your own projects that needs to be fixed upstream in Zig, you'll have to use the older version until the next scheduled nominated version update.

## Nominated Zig history

### 2024.01

**IN-PROGRESS:** This version is currently being nominated, see [the tracking issue](https://github.com/hexops/mach/issues/1135) for details. Once everything looks good, the new Zig version is confirmed to be working with Mach, we will declare success, close the issue, and remove this in-progress warning.

Equal to Zig `0.12.0-dev.2059+42389cb9c`

_Note: The first nominated version ever, this was out-of-band with the schedule due to it._

Install it using [zigup](https://github.com/marler8997/zigup):

```sh
zigup 0.12.0-dev.2059+42389cb9c
```

Or download it using our [pkg.machengine.org](https://pkg.machengine.org) mirror:

| OS/Arch                           | Kind   | Download mirror                                                                                                                         |
|-----------------------------------|--------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **Linux x86_64**                  | Binary | [zig-linux-x86_64-0.12.0-dev.2059+42389cb9c.tar.xz](https://pkg.machengine.org/zig/zig-linux-x86_64-0.12.0-dev.2059+42389cb9c.tar.xz)   |
| **Linux aarch64** (ARM)           | Binary | [zig-linux-aarch64-0.12.0-dev.2059+42389cb9c.tar.xz](https://pkg.machengine.org/zig/zig-linux-aarch64-0.12.0-dev.2059+42389cb9c.tar.xz) |
| **Windows x86_64**                | Binary | [zig-windows-x86_64-0.12.0-dev.2059+42389cb9c.zip](https://pkg.machengine.org/zig/zig-windows-x86_64-0.12.0-dev.2059+42389cb9c.zip)     |
| **Windows aarch64** (ARM)         | Binary | [zig-windows-aarch64-0.12.0-dev.2059+42389cb9c.zip](https://pkg.machengine.org/zig/zig-windows-aarch64-0.12.0-dev.2059+42389cb9c.zip)   |
| **macOS x86_64** (Intel)          | Binary | [zig-macos-x86_64-0.12.0-dev.2059+42389cb9c.tar.xz](https://pkg.machengine.org/zig/zig-macos-x86_64-0.12.0-dev.2059+42389cb9c.tar.xz)   |
| **macOS aarch64** (Apple Silicon) | Binary | [zig-macos-aarch64-0.12.0-dev.2059+42389cb9c.tar.xz](https://pkg.machengine.org/zig/zig-macos-aarch64-0.12.0-dev.2059+42389cb9c.tar.xz) |
| Source code                       | Source | [zig-0.12.0-dev.2059+42389cb9c.tar.xz](https://pkg.machengine.org/zig/zig-0.12.0-dev.2059+42389cb9c.tar.xz)                             |

_**Installation:** Download, extract, and place on your system `$PATH`. Ensure `zig version` reports the right version._

_**Signatures:** `.minisig` Download signatures can be retrieved from [ziglang.org](https://ziglang.org/download/) for all downloads._