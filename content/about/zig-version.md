---
title: "Zig version"
description: "Zig versions that Mach supports"
draft: false
layout: "docs"
docs_type: "about"
rss_ignore: true
---

# Zig version

Mach [nominates new Zig versions](../nominated-zig) periodically, these are **specific Zig nightly versions** and what Mach is built and tested against. Other versions, such as stable or latest-nightly releases, are usually incompatible.

## Mach nightly

_We encourage using Mach nightly (`main`, rather than a tagged release) for now._

Mach nightly is compatible with Zig `0.12.0-dev.1092+68ed78775`

Install it using [zigup](https://github.com/marler8997/zigup):

```sh
zigup 0.12.0-dev.1092+68ed78775
```

Or download it using our [pkg.machengine.org](https://pkg.machengine.org) mirror:

| OS/Arch                           | Kind   | Download mirror                                                                                                                         |
|-----------------------------------|--------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **Linux x86_64**                  | Binary | [zig-linux-x86_64-0.12.0-dev.1092+68ed78775.tar.xz](https://pkg.machengine.org/zig/zig-linux-x86_64-0.12.0-dev.1092+68ed78775.tar.xz)   |
| **Linux aarch64** (ARM)           | Binary | [zig-linux-aarch64-0.12.0-dev.1092+68ed78775.tar.xz](https://pkg.machengine.org/zig/zig-linux-aarch64-0.12.0-dev.1092+68ed78775.tar.xz) |
| **Windows x86_64**                | Binary | [zig-windows-x86_64-0.12.0-dev.1092+68ed78775.zip](https://pkg.machengine.org/zig/zig-windows-x86_64-0.12.0-dev.1092+68ed78775.zip)     |
| **Windows aarch64** (ARM)         | Binary | [zig-windows-aarch64-0.12.0-dev.1092+68ed78775.zip](https://pkg.machengine.org/zig/zig-windows-aarch64-0.12.0-dev.1092+68ed78775.zip)   |
| **macOS x86_64** (Intel)          | Binary | [zig-macos-x86_64-0.12.0-dev.1092+68ed78775.tar.xz](https://pkg.machengine.org/zig/zig-macos-x86_64-0.12.0-dev.1092+68ed78775.tar.xz)   |
| **macOS aarch64** (Apple Silicon) | Binary | [zig-macos-aarch64-0.12.0-dev.1092+68ed78775.tar.xz](https://pkg.machengine.org/zig/zig-macos-aarch64-0.12.0-dev.1092+68ed78775.tar.xz) |
| Source code                       | Source | [zig-0.12.0-dev.1092+68ed78775.tar.xz](https://pkg.machengine.org/zig/zig-0.12.0-dev.1092+68ed78775.tar.xz)                             |

_**Installation:** Download, extract, and place on your system `$PATH`. Ensure `zig version` reports the right version._

_**Signatures:** `.minisig` Download signatures can be retrieved from [ziglang.org](https://ziglang.org/download/) for all downloads._

## Version history

### Mach v0.2

Mach v0.2 is compatible with Zig v0.11. This was just by coincidence.
