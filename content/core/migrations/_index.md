---
title: "Migration notes - Mach core & libraries"
description: "In the event of a breaking change, this page details any migration steps neccessary to upgrade your code to the latest version of Mach core or one of our standalone libraries."
draft: false
layout: "docs"
docs_type: "core"
rss_ignore: true
images: ["/img/mach-opengraph.png"]
---

# Migration notes

To learn more about Mach's library stability guarantees, check out the [libraries overview](../pkg) page. This page provides migration guides for Mach libraries-walking you through how to update your code to the latest version.

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

mach-core is now available as a 100% standalone repository / Zig package. The [getting started](../getting-started.md) documentation has been updated to reflect this.

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
