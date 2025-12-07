---
title: "Getting started"
description: "Getting started using Mach"
draft: false
layout: "docs"
docs_type: "docs"
rss_ignore: true
---

<div class="color-bg" style="align-self: center;">
    <p style="max-width: 39rem; border-left: 2px solid black; border-right: 2px solid black; text-align: center; padding: 0.5rem !important; margin-top: 0; background: #8a3535; padding: 1rem;">Mach is in <a href="/about/faq/#experimental">early-stages of development.</a></p>
</div>

# Getting Started using Mach

## Initialize your Zig project

```sh
zig init
```

Delete the `src/` files it created, we won't need them.

## Add Mach dependency to `build.zig.zon`

<pre><code id="zig-fetch-main">zig fetch --save https://pkg.machengine.org/mach/$LATEST_COMMIT.tar.gz
</code></pre>
<script>
fetch('https://api.github.com/repos/hexops/mach/branches/main', {
  method: 'GET',
  headers: {'Accept': 'application/json'}},
)
  .then(resp => resp.json())
  .then(resp => {
    let elem = document.querySelector('#zig-fetch-main');
    elem.innerHTML = elem.innerHTML.replace('$LATEST_COMMIT', resp.commit.sha);
  });
</script>

## Create your `build.zig` file

A basic `build.zig` file for use with Mach looks like this:

```zig
const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Create our Mach app module, where all our code lives.
    const app_mod = b.createModule(.{
        .root_source_file = b.path("src/App.zig"),
        .optimize = optimize,
        .target = target,
    });

    // Add Mach import to our app.
    const mach_dep = b.dependency("mach", .{
        .target = target,
        .optimize = optimize,
    });
    app_mod.addImport("mach", mach_dep.module("mach"));

    // Have Mach create the executable for us
    const exe = @import("mach").addExecutable(mach_dep.builder, .{
        .name = "hello-world",
        .app = app_mod,
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe);

    // Run the app when `zig build run` is invoked
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    // Run tests when `zig build test` is run
    const app_unit_tests = b.addTest(.{
        .root_module = app_mod,
    });
    const run_app_unit_tests = b.addRunArtifact(app_unit_tests);
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_app_unit_tests.step);
}
```

## Create your `src/App.zig` file

This is where all our program code lives, it will render a triangle:

```zig
const std = @import("std");
const mach = @import("mach");
const gpu = mach.gpu;

const App = @This();

// The set of Mach modules our application may use.
pub const Modules = mach.Modules(.{
    mach.Core,
    App,
});

pub const mach_module = .app;

pub const mach_systems = .{ .main, .init, .tick, .deinit };

pub const main = mach.schedule(.{
    .{ mach.Core, .init },
    .{ App, .init },
    .{ mach.Core, .main },
});

window: mach.ObjectID,
title_timer: mach.time.Timer,
pipeline: *gpu.RenderPipeline,

pub fn init(
    core: *mach.Core,
    app: *App,
    app_mod: mach.Mod(App),
) !void {
    core.on_tick = app_mod.id.tick;
    core.on_exit = app_mod.id.deinit;

    const window = try core.windows.new(.{
        .title = "core-triangle",
    });

    // Store our render pipeline in our module's state, so we can access it later on.
    app.* = .{
        .window = window,
        .title_timer = try mach.time.Timer.start(),
        .pipeline = undefined,
    };
}

fn setupPipeline(core: *mach.Core, app: *App, window_id: mach.ObjectID) !void {
    var window = core.windows.getValue(window_id);
    defer core.windows.setValueRaw(window_id, window);

    // Create our shader module
    const shader_module = window.device.createShaderModuleWGSL("shader.wgsl", @embedFile("shader.wgsl"));
    defer shader_module.release();

    // Blend state describes how rendered colors get blended
    const blend = gpu.BlendState{};

    // Color target describes e.g. the pixel format of the window we are rendering to.
    const color_target = gpu.ColorTargetState{
        .format = window.framebuffer_format,
        .blend = &blend,
    };

    // Fragment state describes which shader and entrypoint to use for rendering fragments.
    const fragment = gpu.FragmentState.init(.{
        .module = shader_module,
        .entry_point = "frag_main",
        .targets = &.{color_target},
    });

    // Create our render pipeline that will ultimately get pixels onto the screen.
    const label = @tagName(mach_module) ++ ".init";
    const pipeline_descriptor = gpu.RenderPipeline.Descriptor{
        .label = label,
        .fragment = &fragment,
        .vertex = gpu.VertexState{
            .module = shader_module,
            .entry_point = "vertex_main",
        },
    };
    app.pipeline = window.device.createRenderPipeline(&pipeline_descriptor);
}

pub fn tick(app: *App, core: *mach.Core) void {
    while (core.nextEvent()) |event| {
        switch (event) {
            .window_open => |ev| {
                try setupPipeline(core, app, ev.window_id);
            },
            .close => core.exit(),
            else => {},
        }
    }

    const window = core.windows.getValue(app.window);

    // Grab the back buffer of the swapchain
    const back_buffer_view = window.swap_chain.getCurrentTextureView().?;
    defer back_buffer_view.release();

    // Create a command encoder
    const label = @tagName(mach_module) ++ ".tick";

    const encoder = window.device.createCommandEncoder(&.{ .label = label });
    defer encoder.release();

    // Begin render pass
    const sky_blue_background = gpu.Color{ .r = 0.776, .g = 0.988, .b = 1, .a = 1 };
    const color_attachments = [_]gpu.RenderPassColorAttachment{.{
        .view = back_buffer_view,
        .clear_value = sky_blue_background,
        .load_op = .clear,
        .store_op = .store,
    }};
    const render_pass = encoder.beginRenderPass(&gpu.RenderPassDescriptor.init(.{
        .label = label,
        .color_attachments = &color_attachments,
    }));
    defer render_pass.release();

    // Draw
    render_pass.setPipeline(app.pipeline);
    render_pass.draw(3, 1, 0, 0);

    // Finish render pass
    render_pass.end();

    // Submit our commands to the queue
    var command = encoder.finish(&.{ .label = label });
    defer command.release();
    window.queue.submit(&[_]*gpu.CommandBuffer{command});
}

pub fn deinit(app: *App) void {
    app.pipeline.release();
}
```

## Create your `src/shader.wgsl` program

This is the fragment and vertex GPU shader used to render the triangle:

```wgsl
@vertex fn vertex_main(
    @builtin(vertex_index) VertexIndex : u32
) -> @builtin(position) vec4<f32> {
    var pos = array<vec2<f32>, 3>(
        vec2<f32>( 0.0,  0.5),
        vec2<f32>(-0.5, -0.5),
        vec2<f32>( 0.5, -0.5)
    );
    return vec4<f32>(pos[VertexIndex], 0.0, 1.0);
}

@fragment fn frag_main() -> @location(0) vec4<f32> {
    return vec4<f32>(1.0, 0.0, 0.0, 1.0);
}
```

## Build and run

```sh
zig build run
```

This will open a window and display a triangle:

![](/example/core-triangle.png)

## Run tests

If you later decide to add any Zig `test` blocks to your `src/App.zig`, you can run them using `zig build test`.

## Cross-compile

You can cross-compile this program to any major desktop OS using the following:

```sh
# Linux
zig build -Dtarget=x86_64-linux-gnu

# macOS (Apple Silicon)
zig build -Dtarget=aarch64-macos

# Windows
zig build -Dtarget=x86_64-windows-gnu
```

(the output will be in `zig-out/bin/`)

## Continue learning

From here, you can [explore more examples](https://github.com/hexops/mach/tree/main/examples) or read about [the object systems](/docs/object/) which is the foundation of every Mach API.

