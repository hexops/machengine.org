---
title: "Zig version"
description: "Zig versions that Mach supports"
draft: false
layout: "docs"
docs_type: "about"
rss_ignore: true
---

## Supported Zig version

Mach aims to follow the latest Zig nightly version, but is sometimes a week or so behind.

We update every Mach project every few weeks and in unison with one another, so that everything works and is being tested with a _specific nightly version_. That is the version you are expected to use.

Download the latest supported Zig version from our pkg.machengine.org mirror:

| OS/Arch                           | Kind   | Download mirror                                                                                                                         |
| --------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------- |
| **Linux x86_64**                  | Binary | [zig-linux-x86_64-0.12.0-dev.1092+68ed78775.tar.xz](https://pkg.machengine.org/zig/zig-linux-x86_64-0.12.0-dev.1092+68ed78775.tar.xz)   |
| **Linux aarch64** (ARM)           | Binary | [zig-linux-aarch64-0.12.0-dev.1092+68ed78775.tar.xz](https://pkg.machengine.org/zig/zig-linux-aarch64-0.12.0-dev.1092+68ed78775.tar.xz)     |
| **Windows x86_64**                | Binary | [zig-windows-x86_64-0.12.0-dev.1092+68ed78775.zip](https://pkg.machengine.org/zig/zig-windows-x86_64-0.12.0-dev.1092+68ed78775.zip)     |
| **Windows aarch64** (ARM)         | Binary | [zig-windows-aarch64-0.12.0-dev.1092+68ed78775.zip](https://pkg.machengine.org/zig/zig-windows-aarch64-0.12.0-dev.1092+68ed78775.zip)       |
| **macOS x86_64** (Intel)          | Binary | [zig-macos-x86_64-0.12.0-dev.1092+68ed78775.tar.xz](https://pkg.machengine.org/zig/zig-macos-x86_64-0.12.0-dev.1092+68ed78775.tar.xz)   |
| **macOS aarch64** (Apple Silicon) | Binary | [zig-macos-aarch64-0.12.0-dev.1092+68ed78775.tar.xz](https://pkg.machengine.org/zig/zig-macos-aarch64-0.12.0-dev.1092+68ed78775.tar.xz) |
| Source code                       | Source | [zig-0.12.0-dev.1092+68ed78775.tar.xz](https://pkg.machengine.org/zig/zig-0.12.0-dev.1092+68ed78775.tar.xz)                                 |

_**Signatures:** `.minisig` Download signatures can be retrieved from [ziglang.org](https://ziglang.org/download/) for all downloads._

## Installation

Download, extract, and place on your system `$PATH`. Ensure `zig version` reports the right version.

## Version history

* Mach v0.2 is compatible with Zig v0.11
  * Note: This was coincidental, and future releases will be compatible with specific Zig nightly versions instead.
