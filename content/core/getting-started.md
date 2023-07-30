---
title: "Getting started - Mach core"
draft: false
layout: "docs"
docs_type: "core"
rss_ignore: true
images: ["/img/mach-opengraph.png"]
---

# Getting Started with _Mach core_

Here you will learn how to use _mach-core_ in your own project/repository. If you haven't already, check out the [examples](../examples) as those describe how to actually use Mach core's APIs, this page just describes project setup.

## Mach is now using the Zig package manager

_Note: Mach has recently been updated to make use of the _experimental Zig package manager_, although it cannot yet be used for all our dependencies due to some bugs with it. You will need to use both some Git submodules and a `build.zig.zon` file for the Zig package manager._

_This process is a little bit rough today, but we'll walk you through it and are working on improving it._

## Creating a new project

### Create Zig project

```sh
mkdir myproject/
cd myproject/
git init
zig init-exe
```

### Add dependencies

Add mach-core and its dependencies as submodules:

```sh
git submodule add https://github.com/hexops/mach-core libs/mach-core
git submodule add https://github.com/hexops/mach-gpu libs/mach-gpu
git submodule add https://github.com/hexops/mach-gpu-dawn libs/mach-gpu-dawn
git submodule update --init --recursive
```

### Create build.zig.zon dependency file

Copy [mach-core's build.zig.zon](https://github.com/hexops/mach-core/blob/main/build.zig.zon) file into your project, next to your `build.zig`.

### Setup build.zig

Your `build.zig` file will need to use `mach.App` to declare how your application should be built. Your `build.zig` should look something like this:

```zig
const std = @import("std");
const mach_gpu_dawn = @import("libs/mach-gpu-dawn/build.zig");
const mach_gpu = @import("libs/mach-gpu/build.zig").Sdk(.{
    .gpu_dawn = mach_gpu_dawn,
});
const mach_core = @import("libs/mach-core/build.zig").Sdk(.{
    .gpu_dawn = mach_gpu_dawn,
    .gpu = mach_gpu,
});

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const app = try mach_core.App.init(b, .{
        .name = "myapp",
        .src = "src/main.zig",
        .target = target,
        .deps = &[_]std.build.ModuleDependency{},
        .optimize = optimize,
    });

    if (b.args) |args| {
        app.run.addArgs(args);
    }
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&app.run.step);

    const unit_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    const run_unit_tests = b.addRunArtifact(unit_tests);
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_unit_tests.step);
}
```

### Add example code

To begin coding your project, we suggesting copying the two files from the `triangle` example into your `src/` folder:

* [`main.zig`](https://raw.githubusercontent.com/hexops/mach-core/main/examples/triangle/main.zig)
* [`shader.wgsl`](https://raw.githubusercontent.com/hexops/mach-core/main/examples/triangle/shader.wgsl)

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

You should now be able to cross-compile to every desktop OS using:

```sh
zig build -Dtarget=x86_64-windows
zig build -Dtarget=x86_64-linux-gnu
zig build -Dtarget=x86_64-macos
zig build -Dtarget=aarch64-macos
```

### Run in the browser

Mach doesn't yet support _graphics_ in the browser ([issue #90](https://github.com/hexops/mach/issues/90)), but windowing, input, and audio all work already - as well as a nice dev server CLI we have. We're actively collaborating on building browser support in the `#wasm` channel in [Discord](/discord) and will update this section once it is ready.

## Questions? Ran into an issue?

There are two ways to get help:

* [File a GitHub issue](https://github.com/hexops/mach/issues)
* [Join our Discord](/discord) and create a thread in `#help`
