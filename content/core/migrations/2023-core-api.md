---
title: "Migration notes - Mach core v0.2 API redesign"
description: "In the event of a breaking change, this page details any migration steps neccessary to upgrade your code to the latest version of Mach core or one of our standalone libraries."
draft: false
layout: "docs"
docs_type: "core"
rss_ignore: true
---

# mach/core: v0.2 API redesign

Mach v0.2 brought a complete redesign of the mach/core API. To upgrade your application, see the notes below.

See also the [migration notes](../) page.

## Updating your application

Previously, a complete Mach Core application looked something like this:

```zig
pub const App = @This();

pub fn init(app: *App, core: *mach.Core) !void {
    // ...
}

pub fn deinit(_: *App, _: *mach.Core) void {}

pub fn update(app: *App, core: *mach.Core) !void {
    while (core.pollEvent()) |event| {
        switch (event) {
            .key_press => |ev| {
                if (ev.key == .space) core.close();
            },
            else => {},
        }
    }
    // core.swap_chain_format
    core.swap_chain.?.present();
}

// optional
pub fn resize(app: *App, core: *mach.Core, width: u32, height: u32) !void {
    // use core.device
}
```

After these changes, the above now looks like this:

```zig
pub const App = @This();

var gpa = std.heap.GeneralPurposeAllocator(.{}){};

core: mach.Core,

pub fn init(app: *App) !void {
    const allocator = gpa.allocator();
    try app.core.init(allocator, .{});
    // ...
}

pub fn deinit(app: *App) void {
    defer _ = gpa.deinit();
    defer app.core.deinit();
}

pub fn update(app: *App) !bool {
    var iter = app.core.pollEvents();
    while (iter.next()) |event| {
        switch (event) {
            .key_press => |ev| {
                if (ev.key == .space) core.close();
            },
            .framebuffer_resize => |ev| {
                // optional event - framebuffer resized to ev.width, ev.height
                // use app.core.device()
            },
            .close => return true,
            else => {},
        }
    }
    // core.swap_chain_format -> core.descriptor().format
    core.swapchain().present();
    return false;
}
```

Notably:

* `mach.Core` is no longer a parameter provided to your `App`, instead, Mach only calls `init`/`update`/`deinit` callbacks of your app, and you are responsible for maintaining a `mach.Core` instance and using it.
* It is now possible to specify your own allocator for `mach.Core` to use.
* `core.pollEvent` has been renamed to `core.pollEvents` and now returns an iterator of events.
* `App.update` must now return `!bool` instead of `!void`, the bool indicates if the program should exit.
* `App.resize` is no longer an allowed optional callback, instead a `framebuffer_resize` event was added.
* A `.close` event was added which you should handle by e.g. `return true` to exit the program.
* Some commonly used fields were renamed:
  * `core.swapchain` -> `core.swapchain()`
  * `core.swap_chain_format` -> `core.descriptor().format`

## Questions?

Trouble updating, or have questions? We're always happy to help, feel free to [join our Discord](../../../discord.md)!
