---
title: "Migration notes"
description: "In the event of a breaking change, this page details any migration steps neccessary to upgrade your code to the latest version of Mach core or one of our standalone libraries."
draft: false
layout: "docs"
docs_type: "core"
rss_ignore: true
---

# Migration notes

To learn more about Mach's library stability guarantees, check out the [libraries overview](../../pkg) page. This page provides migration guides for Mach libraries-walking you through how to update your code to the latest version.

## mach.core: migration to new 'Mach Module' system

`mach.core` is migrating to a new Mach' module system API design. To upgrade, you can follow the [getting started](../getting-started) guide to see how a basic project looks and upgrade your code accordingly.

Because the build API is much simpler (no more `CoreApp`), `mach-core-starter-project` is officially deprecated in favor of that getting started guide,

## mach.core: package URL change (2024-03-06)

As part of [#1165](https://github.com/hexops/mach/issues/1165) mach-core is now part of the Mach standard library. The code now lives in https://github.com/hexops/mach and can be imported as `@import("mach").core`.

Thanks to lazy code evaluation, and lazy dependencies recently added to Zig, we can have this code live in the same repository which makes testing and contributing easier - while still enabling someone to 'just use mach [core,sysaudio,sysgpu] without the entire engine'.

To update your mach-core project, [make these changes](https://github.com/hexops/mach-core-starter-project/commit/cb319048dc793dff22a2a905af12d0a61c97e0db).

See [the Mach standard library](/engine/stdlib/) for details on how the stdlib works, lazy dependencies, etc.

## mach-core: updated to Zig 2024.1.0-mach (2024-01-14)

Mach core [967d9b7](https://github.com/hexops/mach-core/tree/370bc1504cebaffcda5ed1ae9915fd2ac6778479) and above now uses [Zig 2024.1.0-mach](/about/nominated-zig/#202410-mach). This is the first mach-core version to follow [nominated Zig versions](https://devlog.hexops.com/2024/announcing-nominated-zig/).

To update your mach-core project, [make these changes](https://github.com/hexops/mach-core-starter-project/commit/73633db522740e68ac4a65841f5e13924ceb0eef).

To update your Zig code in general, see: [_tips on upgrading your Zig code_](https://github.com/hexops/mach/issues/1135#issuecomment-1891175749).

## mach-core: Zig version update (2023-10-17)

Mach core [331ce61](https://github.com/hexops/mach-core/tree/331ce61cb8c075be6d7c46e49da8ccbd5967d9b7) and above now uses Zig version [`0.12.0-dev.978+78855bd21`](/about/zig-version/).

To update your mach-core project, [follow this diff](https://github.com/hexops/mach-core-starter-project/commit/b079bfb4e080f4c429f468a0c7f636608737346c).

## mach-core: build API improvements (2023-09-24)

Imports now have a `mach-` prefix:

```diff
-const core = @import("core");
+const core = @import("mach-core");
```

The `module()` helper (you likely do not use this) has been replaced with a proper Zig module accessible via `b.dependency("mach_core", .{...}).module("mach-core")`

## mach-core: build API improvements (2023-09-17)

Zig `0.12.0-dev.389+61b70778b` is now in use (previously `0.12.0-dev.21+ac95cfe44`); and your `build.zig.zon` file no longer needs to specify transitive dependencies, and the `build.zig` API has changed slightly:

* [mach-core changes diff](https://github.com/hexops/mach-core-starter-project/commit/1bab9664f78eec5e71005fc0e341625a23995201)
* [Other packages diff](https://github.com/hexops/machengine.org/commit/0a8723ea2be0f109348713e689467f0bf8786429)

## mach-core: API design changes (2023-08-07)

### printTitle

Instead of writing e.g. this before:

```zig
const title = try std.fmt.bufPrintZ(&core.title, "Sprite2D [ FPS: {d} ]", .{@floor(1 / delta_time)});
core.setTitle(title);
```

It is now possible to write just:

```zig
try core.printTitle("Sprite2D [ FPS: {d} ]", .{@floor(1 / delta_time)});
```

### Delta time, frame rate

Internal timers now provide reasonable default methods of measuring frame rate, input rate, and frame delta time.

* `core.frameRate()`
* `core.inputRate()`
* `core.delta_time` (f32 seconds)
* `core.delta_time_ns` (u64 nanoseconds)

### mach.Core is now a global

* Your `App` struct no longer needs to have a field `core: mach.Core,` (before it was required, and the name MUST be `core`)
* APIs that were accessible through a `*Core` instance before, e.g. `app.core.frameRate()`, are now accessible as global methods. e.g. `@import("core").frameRate()`
* `core.init` no longer needs an allocator, instead `core.allocator` is used - which you can change at any point before calling `core.init()`

#### Before

```zig
pub const App = @This();

var gpa = std.heap.GeneralPurposeAllocator(.{}){};

core: mach.Core,

pub fn init(app: *App) !void {
    try app.core.init(gpa.allocator(), .{});
    app.* = .{
        // ...
    };
}

pub fn deinit(app: *App) void {
    defer _ = gpa.deinit();
    defer app.core.deinit();
    // ...
}

pub fn update(app: *App) !bool {
    // ...
    return false;
}
```

#### After

```zig
pub const App = @This();

pub fn init(app: *App) !void {
    try core.init(.{});
    app.* = .{
        // ...
    };
}

pub fn deinit(app: *App) void {
    defer core.deinit();
    // ...
}

pub fn update(app: *App) !bool {
    // ...
    return false;
}
```

### Custom entrypoints

It's now easier than ever to write a custom entrypoint for your application (e.g. `pub fn main`) if you really want/need to:

* WASM: [42 lines of code](https://github.com/hexops/mach-core/blob/7a3d7e469dfc3893acbca163be79ed426c634317/src/platform/wasm/main.zig)
* desktop: [33 lines of code](https://github.com/hexops/mach-core/blob/7a3d7e469dfc3893acbca163be79ed426c634317/src/platform/native/main.zig)

### Fields instead of getters

A few getters have been turned into fields instead:

* `core.device()` -> `core.device`
* `core.device().getQueue()` -> `core.queue`
* `core.descriptor()` -> `core.descriptor`
* `core.adapter()` -> `core.adapter`
* `core.swapChain()` -> `core.swap_chain`

## mach-core: build system changes

The following fields/functions from `mach.App` in `build.zig` have been removed:

* `.step`
* `.install()`
* `.addRunArtifact()`
* `.getInstallStep()`
* `.link(.{ .gpu_dawn_options = .{} })`

The following have been added:

* `.compile.step`
* `.install.step`
* `.run.step`
* `App.init(.{ .gpu_dawn_options = .{} })`

Suggested usage is now e.g.:

```zig
const app = try core.App.init(...);

const install_step = b.step("install", "Install " ++ example.name);
install_step.dependOn(&app.install.step);
b.getInstallStep().dependOn(install_step);

const run_step = b.step("run", "Run " ++ example.name);
run_step.dependOn(&app.run.step);
```

It is also possible to add a 'compile only' step now, for e.g. checking code merely builds should you want to:

```zig
const compile_step = b.step("compile", "Install " ++ example.name);
compile_step.dependOn(&app.compile.step);
```

## mach-core: multithreaded rendering & standalone usage

mach-core is now available as a 100% standalone repository / Zig package. The [getting started](../getting-started) documentation has been updated to reflect this.

Additionally, we have landed [multi-threaded rendering support](https://github.com/hexops/mach-core/pull/15) which allows native applications to run at e.g. 60FPS while handling input events at 240hz. It also enables butter-smooth window resizing.

API changes:

* `core.framebufferSize()` has been removed in favor of `core.descriptor().width` and `core.descriptor().height`
* `App.init` and `App.deinit` are executed on the main thread, `App.update` is executed in a separate thread.
* Input events are enqueued/bufferred, and you can poll them whenever you like (e.g. you may handle input mid-frame if you like.)
* `setWaitTimeout` / "waiting" APIs are being redesigned and are not yet functional. e.g. for the case of a  desktop app that you rightfully want to be low-power, in this scenario you need a way to slow event polling of both the main thread and rendering thread - which is not yet possible.

## mach-glfw: package manager usage

If you are a user of mach-glfw, note that we have adopted the experimental Zig package manager. It is not perfect yet and there are many papercuts; for details on how to update your codebase [please see this](https://github.com/hexops/mach/issues/861#issuecomment-1638185447)

## mach-core: v0.2 API redesign
<div class="subtext">2023-01-27 - affects all mach-core users</div>

Mach v0.2 brings a complete redesign of the mach-core API. To upgrade your application see [the upgrade guide](2023-core-api)

## mach-glfw: error handling improvements
<div class="subtext">2023-01-10 - affects all mach-glfw users</div>

We've made another error handling improvement to the `mach-glfw` API:

- `glfw.getError` has been renamed to `glfw.getErrorCode` (returns a Zig error type still)
- `glfw.getError` instead now returns a struct with _both_ the error message and Zig error type.
- `glfw.clearError` has been added, a smaller helper to make writing `defer glfw.clearError()` nicer than before (`defer glfw.getErrorCode() catch {};`).

* [More information](https://github.com/hexops/mach/pull/668)

## glfw: error handling changes
<div class="subtext">2023-01-08 - affects all mach-glfw users</div>

We have completely overhauled the mach-glfw error handling approach to help users better avoid footguns and ultimately improve the ability of Zig GLFW applications to run on more obscure X11 window managers and Wayland in general.

* [More information](https://github.com/hexops/mach/pull/662)
* How to update: please see "The solution" in https://github.com/hexops/mach/pull/662
