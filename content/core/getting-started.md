---
title: "Getting started"
description: "Get started using Mach core in your own project, in your own repository."
draft: false
layout: "docs"
docs_type: "core"
rss_ignore: true
---

# Getting Started with _Mach core_

Here you will learn how to use _mach-core_ in your own project/repository. If you haven't already, check out the [examples](../examples) as those describe how to actually use Mach core's APIs, this page just describes project setup.

## Option 1: Copying the starter project

If you like, you can simply start by copying [this starter project](https://github.com/hexops/mach-core-getting-started) - where we ran through all the steps below for you.

## Option 2: Create a project from scratch

### Create Zig project

```sh
mkdir myproject/
cd myproject/
zig init-exe
```

### Add dependencies

mach-core uses the Zig package manager. Create a `build.zig.zon` file [like this](https://github.com/hexops/mach-core-getting-started/blob/main/build.zig.zon) in your project next to your `build.zig` file. Replace `LATEST_COMMIT` with the latest commit hash:

```zig
.{
    .name = "myproject",
    .version = "0.1.0",
    .dependencies = .{
        .mach_core = .{
            .url = "https://pkg.machengine.org/mach-core/LATEST_COMMIT.tar.gz",
        },
    },
}
```

Run `zig build` in your project, and the compiler will instruct you to add a `.hash = "..."` field next to `.url`:

```
note: expected .hash = "12209838fcfb7a77d2d6931efdc7448c033a1b7dad11d082c94bbeeba9d1038cd311",
```

### Setup build.zig

Your `build.zig` file will need to use `mach.App` to declare how your application should be built. Your `build.zig` should look something like this:

```zig
const std = @import("std");
const mach_core = @import("mach_core");

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) !void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall. Here we do not
    // set a preferred release mode, allowing the user to decide how to optimize.
    const optimize = b.standardOptimizeOption(.{});

    const mach_core_dep = b.dependency("mach_core", .{
        .target = target,
        .optimize = optimize,
    });
    const app = try mach_core.App.init(b, mach_core_dep.builder, .{
        .name = "myapp",
        .src = "src/main.zig",
        .target = target,
        .optimize = optimize,
        .deps = &[_]std.Build.Module.Import{},
    });
    if (b.args) |args| app.run.addArgs(args);

    // This creates a build step. It will be visible in the `zig build --help` menu,
    // and can be selected like this: `zig build run`
    // This will evaluate the `run` step rather than the default, which is "install".
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&app.run.step);

    // Creates a step for unit testing. This only builds the test executable
    // but does not run it.
    const unit_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    // Similar to creating the run step earlier, this exposes a `test` step to
    // the `zig build --help` menu, providing a way for the user to request
    // running the unit tests.
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

Make sure you're using a [supported Zig version](/about/zig-version/)

There are two ways to get help:

* [File a GitHub issue](https://github.com/hexops/mach/issues)
* [Join our Discord](/discord) and create a thread in `#help`
