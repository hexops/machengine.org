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

## Creating a new project

### Create Zig project

```sh
mkdir myproject/
cd myproject/
zig init-exe
```

### Add dependencies

mach-core uses the Zig package manager. You'll need a `build.zig.zon` file next to your `build.zig` which has all the same dependencies as mach-core.

To start, simply copy [mach-core's build.zig.zon](https://github.com/hexops/mach-core/blob/main/build.zig.zon) file into your project, and place it next to your `build.zig`.

You will need to _add a `.mach_core` entry_:

```zig
.mach_core = .{
    .url = "https://pkg.machengine.org/mach-core/69209f02d62ca8af64aa4084669ff6bc89c4d36f.tar.gz",
},
```

Run `zig build` in your project, and the compiler instruct you to add a `.hash = "..."` field next to `.url`:

```
note: expected .hash = "12209838fcfb7a77d2d6931efdc7448c033a1b7dad11d082c94bbeeba9d1038c1337",
```

### Setup build.zig

Your `build.zig` file will need to use `mach.App` to declare how your application should be built. Your `build.zig` should look something like this:

```zig
const std = @import("std");
const mach_core = @import("mach_core");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    mach_core.mach_glfw_import_path = "mach_core.mach_gpu.mach_gpu_dawn.mach_glfw";
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

Note: the convoluted line `mach_core.mach_glfw_import_path = "mach_core.mach_gpu.mach_gpu_dawn.mach_glfw";` is a workaround for a bug in the Zig package manager [hexops/mach#902](https://github.com/hexops/mach/issues/902)

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
