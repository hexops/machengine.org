---
title: "Getting Started"
draft: false
layout: "docs"
rss_ignore: true
doc_type: "main"
---

# Getting Started

This section will help you quickly dive into Mach

## Try Examples

Clone the [mach-examples](https://github.com/hexops/mach-examples) repo and run _boids_ example:

```sh
git clone --recursive https://github.com/hexops/mach-examples
cd mach-examples/
zig build run-boids
```

## Bare bones app/game

1.  Initialize your zig project:

    ```sh
    mkdir my-project/
    cd my-project/
    zig init-exe
    ```

2.  Clone Mach:

    ```sh
    mkdir libs/
    git clone --recursive https://github.com/hexops/mach libs/mach
    ```

3.  Link Mach in your `build.zig`

    ```diff
    const std = @import("std");
    ++ const mach = @import("libs/mach/build.zig");

    ++ pub fn build(b: *std.build.Builder) !void {
    -- pub fn build(b: *std.build.Builder) void {
           // Standard target options allows the person running `zig build` to choose
           // what target to build for. Here we do not override the defaults, which
           // means any target is allowed, and the default is native. Other options
           // for restricting supported target set are available.
           const target = b.standardTargetOptions(.{});

           // Standard release options allow the person running `zig build` to select
           // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
           const mode = b.standardReleaseOptions();

    ++     const app = try mach.App.init(b, .{
    ++         .name = "my-project",
    ++         .src = "src/main.zig",
    ++         .target = target,
    ++     });
    ++     try app.link(.{});
    ++
    ++     const run_cmd = try app.run();
    ++     const run_step = b.step("run", "Run App/Game");
    ++     run_step.dependOn(run_cmd);
    --     const exe = b.addExecutable("mach-test", "src/main.zig");
    --     exe.setTarget(target);
    --     exe.setBuildMode(mode);
    --     exe.install();

    --     const run_cmd = exe.run();
    --     run_cmd.step.dependOn(b.getInstallStep());
    --     if (b.args) |args| {
    --         run_cmd.addArgs(args);
    --     }

    --     const run_step = b.step("run", "Run the app");
    --     run_step.dependOn(&run_cmd.step);

    --     const exe_tests = b.addTest("src/main.zig");
    --     exe_tests.setTarget(target);
    --     exe_tests.setBuildMode(mode);

    --     const test_step = b.step("test", "Run unit tests");
    --     test_step.dependOn(&exe_tests.step);
    }
    ```

4.  Edit `src/main.zig` to this

    ```zig
    const mach = @import("mach");

    pub const App = @This();

    pub fn init(app: *App, core: *mach.Core) !void {
        _ = app;
        _ = core;
    }

    pub fn deinit(app: *App, core: *mach.Core) void {
        _ = app;
        _ = core;
    }

    pub fn update(app: *App, core: *mach.Core) !void {
        _ = app;
        _ = core;
    }
    ```

5.  Build

    ```sh
    zig build run
    ```
