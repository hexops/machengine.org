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

## Why nominated Zig versions, instead of nightly or stable?

**TL;DR: it's a sweetspot between stable and nightly.**

Stable releases occur just once or twice per year, nominated Zig versions occur several times per year - but not every day like nightly.

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

## Machine-readable version history

https://machengine.org/zig/index.json provides a machine-readable version history. It is a strict superset of https://ziglang.org/download/index.json - but updated less frequently, and with Mach versions added. A few types of Mach versions are added:

* `mach-latest` -> always the latest nominated Zig version.
* `2024.1.0-mach-wip` -> `-wip` signifies that we are in the process of nominating this version, it has not been confirmed working with Mach yet.
* `2024.1.0-mach` -> specific nominated versions.
* `0.3.0-mach` -> an alias for the nominated Zig version that was used at the time of Mach v0.3 release.

## Nominated Zig history

### 2024.5.0-mach

Zig `2024.5.0-mach` and `0.13.0-dev.351+64ef45eb0` are identical.

Install it using [zigup](https://github.com/marler8997/zigup):

```sh
zigup 0.13.0-dev.351+64ef45eb0
```

Or download it using our [pkg.machengine.org](https://pkg.machengine.org) mirror:

| OS/Arch                           | Kind   | Download mirror                                                                                                                         |
|-----------------------------------|--------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **Linux x86_64**                  | Binary | [zig-linux-x86_64-0.13.0-dev.351+64ef45eb0.tar.xz](https://pkg.machengine.org/zig/zig-linux-x86_64-0.13.0-dev.351+64ef45eb0.tar.xz)   |
| **Linux aarch64** (ARM)           | Binary | [zig-linux-aarch64-0.13.0-dev.351+64ef45eb0.tar.xz](https://pkg.machengine.org/zig/zig-linux-aarch64-0.13.0-dev.351+64ef45eb0.tar.xz) |
| **Windows x86_64**                | Binary | [zig-windows-x86_64-0.13.0-dev.351+64ef45eb0.zip](https://pkg.machengine.org/zig/zig-windows-x86_64-0.13.0-dev.351+64ef45eb0.zip)     |
| **Windows aarch64** (ARM)         | Binary | [zig-windows-aarch64-0.13.0-dev.351+64ef45eb0.zip](https://pkg.machengine.org/zig/zig-windows-aarch64-0.13.0-dev.351+64ef45eb0.zip)   |
| **macOS x86_64** (Intel)          | Binary | [zig-macos-x86_64-0.13.0-dev.351+64ef45eb0.tar.xz](https://pkg.machengine.org/zig/zig-macos-x86_64-0.13.0-dev.351+64ef45eb0.tar.xz)   |
| **macOS aarch64** (Apple Silicon) | Binary | [zig-macos-aarch64-0.13.0-dev.351+64ef45eb0.tar.xz](https://pkg.machengine.org/zig/zig-macos-aarch64-0.13.0-dev.351+64ef45eb0.tar.xz) |
| Source code                       | Source | [zig-0.13.0-dev.351+64ef45eb0.tar.xz](https://pkg.machengine.org/zig/zig-0.13.0-dev.351+64ef45eb0.tar.xz)                             |

_**Installation:** Download, extract, and place on your system `$PATH`. Ensure `zig version` reports the right version._

_**Signatures:** `.minisig` Download signatures can be retrieved from [ziglang.org](https://ziglang.org/download/) for all downloads._

_**[Tips on upgrading your code](https://github.com/hexops/mach/issues/1180#issuecomment-2143915477)**_

### 2024.3.0-mach

Zig `2024.3.0-mach` and `0.12.0-dev.3180+83e578a18` are identical.

Install it using [zigup](https://github.com/marler8997/zigup):

```sh
zigup 0.12.0-dev.3180+83e578a18
```

Or download it using our [pkg.machengine.org](https://pkg.machengine.org) mirror:

| OS/Arch                           | Kind   | Download mirror                                                                                                                         |
|-----------------------------------|--------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **Linux x86_64**                  | Binary | [zig-linux-x86_64-0.12.0-dev.3180+83e578a18.tar.xz](https://pkg.machengine.org/zig/zig-linux-x86_64-0.12.0-dev.3180+83e578a18.tar.xz)   |
| **Linux aarch64** (ARM)           | Binary | [zig-linux-aarch64-0.12.0-dev.3180+83e578a18.tar.xz](https://pkg.machengine.org/zig/zig-linux-aarch64-0.12.0-dev.3180+83e578a18.tar.xz) |
| **Windows x86_64**                | Binary | [zig-windows-x86_64-0.12.0-dev.3180+83e578a18.zip](https://pkg.machengine.org/zig/zig-windows-x86_64-0.12.0-dev.3180+83e578a18.zip)     |
| **Windows aarch64** (ARM)         | Binary | [zig-windows-aarch64-0.12.0-dev.3180+83e578a18.zip](https://pkg.machengine.org/zig/zig-windows-aarch64-0.12.0-dev.3180+83e578a18.zip)   |
| **macOS x86_64** (Intel)          | Binary | [zig-macos-x86_64-0.12.0-dev.3180+83e578a18.tar.xz](https://pkg.machengine.org/zig/zig-macos-x86_64-0.12.0-dev.3180+83e578a18.tar.xz)   |
| **macOS aarch64** (Apple Silicon) | Binary | [zig-macos-aarch64-0.12.0-dev.3180+83e578a18.tar.xz](https://pkg.machengine.org/zig/zig-macos-aarch64-0.12.0-dev.3180+83e578a18.tar.xz) |
| Source code                       | Source | [zig-0.12.0-dev.3180+83e578a18.tar.xz](https://pkg.machengine.org/zig/zig-0.12.0-dev.3180+83e578a18.tar.xz)                             |

_**Installation:** Download, extract, and place on your system `$PATH`. Ensure `zig version` reports the right version._

_**Signatures:** `.minisig` Download signatures can be retrieved from [ziglang.org](https://ziglang.org/download/) for all downloads._

_**[Tips on upgrading your code](https://github.com/hexops/mach/issues/1147#issuecomment-1986585543)**_

### 2024.1.0-mach

Zig `2024.1.0-mach` and `0.12.0-dev.2063+804cee3b9` are identical.

_Note: The first nominated version ever, this was out-of-band with the schedule due to it._

Install it using [zigup](https://github.com/marler8997/zigup):

```sh
zigup 0.12.0-dev.2063+804cee3b9
```

Or download it using our [pkg.machengine.org](https://pkg.machengine.org) mirror:

| OS/Arch                           | Kind   | Download mirror                                                                                                                         |
|-----------------------------------|--------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **Linux x86_64**                  | Binary | [zig-linux-x86_64-0.12.0-dev.2063+804cee3b9.tar.xz](https://pkg.machengine.org/zig/zig-linux-x86_64-0.12.0-dev.2063+804cee3b9.tar.xz)   |
| **Linux aarch64** (ARM)           | Binary | [zig-linux-aarch64-0.12.0-dev.2063+804cee3b9.tar.xz](https://pkg.machengine.org/zig/zig-linux-aarch64-0.12.0-dev.2063+804cee3b9.tar.xz) |
| **Windows x86_64**                | Binary | [zig-windows-x86_64-0.12.0-dev.2063+804cee3b9.zip](https://pkg.machengine.org/zig/zig-windows-x86_64-0.12.0-dev.2063+804cee3b9.zip)     |
| **Windows aarch64** (ARM)         | Binary | [zig-windows-aarch64-0.12.0-dev.2063+804cee3b9.zip](https://pkg.machengine.org/zig/zig-windows-aarch64-0.12.0-dev.2063+804cee3b9.zip)   |
| **macOS x86_64** (Intel)          | Binary | [zig-macos-x86_64-0.12.0-dev.2063+804cee3b9.tar.xz](https://pkg.machengine.org/zig/zig-macos-x86_64-0.12.0-dev.2063+804cee3b9.tar.xz)   |
| **macOS aarch64** (Apple Silicon) | Binary | [zig-macos-aarch64-0.12.0-dev.2063+804cee3b9.tar.xz](https://pkg.machengine.org/zig/zig-macos-aarch64-0.12.0-dev.2063+804cee3b9.tar.xz) |
| Source code                       | Source | [zig-0.12.0-dev.2063+804cee3b9.tar.xz](https://pkg.machengine.org/zig/zig-0.12.0-dev.2063+804cee3b9.tar.xz)                             |

_**Installation:** Download, extract, and place on your system `$PATH`. Ensure `zig version` reports the right version._

_**Signatures:** `.minisig` Download signatures can be retrieved from [ziglang.org](https://ziglang.org/download/) for all downloads._

_**[Tips on upgrading your code](https://github.com/hexops/mach/issues/1135#issuecomment-1891175749)**_
