---
title: "Getting started - Mach core"
draft: false
layout: "docs"
rss_ignore: true
---

# Getting Started with _Mach core_

If you haven't already, check out the [examples](examples) as these are the best source of how to use Mach core. The rest of this document will describe usage in your own project/repository.

## Creating a project

First run `zig init-exe` to create your project, then add Mach as a Git submodule:

```
git submodule add https://github.com/hexops/mach libs/mach
```

In your `build.zig`, use `mach.App` to define your application:

```zig
const std = @import("std");
const mach = @import("libs/mach/build.zig");

pub fn build(b: *std.build.Builder) !void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    const app = try mach.App.init(b, .{
        .name = "myapp",
        .src = "src/main.zig",
        .target = target,
        .deps = &[_]std.build.Pkg{},
        .mode = mode,
    });
    try app.link(.{});
    app.install();

    const run_cmd = try app.run();
    run_cmd.dependOn(b.getInstallStep());

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(run_cmd);
}
```

Now your `src/main.zig` file can import Mach:

```zig
const mach = @import("mach");
```

To render a triangle, add two files to your `src/` directory:

* [`main.zig`](https://raw.githubusercontent.com/hexops/mach-examples/main/core/triangle/main.zig)
* [`shader.wgsl`](https://raw.githubusercontent.com/hexops/mach-examples/main/core/triangle/shader.wgsl)

Finally, use `zig build run` to launch your application.

## Cross-compilation

You can also cross-compile your app to every OS using:

```sh
zig build -Dtarget=x86_64-windows
zig build -Dtarget=x86_64-linux
zig build -Dtarget=x86_64-macos.12
zig build -Dtarget=aarch64-macos.12
```

## Running in the browser

**Important**: Mach doesn't yet support _graphics_ in the browser (see [issue #90](https://github.com/hexops/mach/issues/90)), but you can already get an idea of how it would look since we support using `sysaudio` for playing audio.

To try the virtual piano example:

```
git clone --recursive https://github.com/hexops/mach-examples
cd mach-examples/
zig build run-sysaudio -Dtarget=wasm32-freestanding
```

Once ran, this will start a server and you can navigate to http://localhost:8080/sysaudio.html

**Instructions:** Click inside the border area + type on your keyboard to play notes.

You can also try running your own project in the browser via `zig build run -Dtarget=wasm32-freestanding`