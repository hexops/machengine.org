---
title: "Getting started"
description: "Get started using Mach core in your own project, in your own repository."
draft: false
layout: "docs"
docs_type: "core"
rss_ignore: true
---

# Getting Started with _Mach core_

Here you will learn how to use _mach core_ in your own project/repository. If you haven't already, check out the [examples](../examples) as those describe how to actually use Mach core's APIs, this page just describes project setup.

## Check you are using the specific Zig version Mach supports

Make sure you're using [the specific Zig version Mach supports](/about/zig-version/) - other Zig versions will not work.

## Create your Zig project

```sh
mkdir myproject/
cd myproject/
zig init
```

## Add Mach as a dependency

[Add the Mach standard library](/engine/stdlib) to your project so you can `@import("mach")`.

Additionally, you will need this line in your `build.zig` file:

```
@import("mach").link(mach_dep.builder, exe);
```

If you get `error: 'dawn/webgpu.h' file not found` then you forgot to add the above line.

## Render a triangle

To begin your project, we suggest starting with three files to render a triangle - simply copy these into your `src/` folder:

* [`main.zig`](https://raw.githubusercontent.com/hexops/mach/main/examples/core/triangle/main.zig)
* [`App.zig`](https://raw.githubusercontent.com/hexops/mach/main/examples/core/triangle/App.zig)
* [`shader.wgsl`](https://raw.githubusercontent.com/hexops/mach/main/examples/core/triangle/shader.wgsl)

## Building your project

### Build / run / unit test

Build your app (executable will go into `zig-out/bin/`):

```sh
zig build
```

Build and run your app (useful while developing):

```sh
zig build run
```

Run [unit tests](https://ziglang.org/documentation/master/#Zig-Test):

```sh
zig build test
```

### Cross-compile

You should now be able to cross-compile to every desktop OS using e.g.:

```sh
zig build -Dtarget=x86_64-windows
zig build -Dtarget=x86_64-linux-gnu
zig build -Dtarget=x86_64-macos
zig build -Dtarget=aarch64-macos
```

## Questions? Ran into an issue?

Make sure you're using a [supported Zig version](/about/zig-version/)

There are two ways to get help:

* [File a GitHub issue](https://github.com/hexops/mach/issues)
* [Join our Discord](/discord) and create a thread in the `#questions` forum
