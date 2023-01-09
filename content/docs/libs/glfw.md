---
title: "mach/glfw: perfected GLFW bindings for Zig"
description: "mach/glfw provides GLFW bindings for Zig with 100% API coverage, zero-fuss installation, cross-compilation, and more."
draft: false
layout: "docs"
rss_ignore: true
---

# Perfected GLFW bindings for Zig

<div style="margin-top: 2rem;">
    <a href="https://github.com/hexops/mach-glfw" class="img-link" style="float: right; padding-left: 1rem;">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/glfw-dark.svg">
            <img alt="mach/glfw" src="/assets/mach/glfw-light.svg" style="width: 20rem; margin-right: 1rem; margin-top: 0.5rem;">
        </picture>
    </a>
    As with all Mach libraries, <a href="../../about/goals#zero-fuss-installation">zero-fuss installation</a>, <a href="../../about/goals#seamless-cross-compilation">cross-compilation</a> at the flip of a switch, and <a href="../../about/goals#platform-support">broad platform support</a> is guaranteed.
    <br/>
    <br/>
    <span style="font-family: Orbitron;"><em>Quick links:</em></span>
    <br/>
    <ul style="display: inline-block;">
        <li><a href="https://github.com/hexops/mach-glfw">mach/glfw on GitHub</a></li>
        <li><a href="https://devlog.hexops.com/2021/perfecting-glfw-for-zig-and-finding-undefined-behavior/">Perfecting GLFW for Zig</a> (article)</li>
    </ul>
</div>

## Features

<h3 style="margin-top: 1rem;">100% API coverage, 130+ tests, etc.</h3>

`mach/glfw` bindings have 100% API coverage of GLFW v3.3.4. Every function, type, constant, etc. has been wrapped in a ziggified API.

There are 130+ tests, and CI tests on all major platforms as well as cross-compilation between platforms:

<h3 style="margin-top: 2rem;">Ziggified GLFW API</h3>

Why create a ziggified GLFW wrapper, instead of just using `@cImport` and interfacing with GLFW directly? You get:

- Comptime guarantees like ensuring you called `glfw.Init()` before any other method which requires init first.
- `true` and `false` instead of `c.GLFW_TRUE` and `c.GLFW_FALSE` constants.
- Generics, so you can just use `window.hint` instead of `glfwWindowHint`, `glfwWindowHintString`, etc.
- **Enums**, always know what value a GLFW function can accept as everything is strictly typed. And use the nice Zig syntax to access enums, like `window.getKey(.escape)` instead of `c.glfwGetKey(window, c.GLFW_KEY_ESCAPE)`
- Slices instead of C pointers and lengths.
- [packed structs](https://ziglang.org/documentation/master/#packed-struct) represent bit masks, so you can use `if (joystick.down and joystick.right)` instead of `if (joystick & c.GLFW_HAT_DOWN and joystick & c.GLFW_HAT_RIGHT)`, etc.
- Methods, e.g. `my_window.hint(...)` instead of `glfwWindowHint(my_window, ...)`

## Examples

<h3 style="margin-top: 1rem;">Vulkan</h3>

<p>
    <img src="https://user-images.githubusercontent.com/3173176/139573985-d862f35a-e78e-40c2-bc0c-9c4fb68d6ecd.png" style="width: 20rem; float: left;">
    Since mach/glfw is only bindings to GLFW, you'll need to bring-your-own Vulkan library if that is how you intend to use it.
    <br/>
    <br/>
    For a Vulkan usage example, see <a href="https://github.com/hexops/mach-glfw-vulkan-example">mach-glfw-vulkan-example</a> - but note that it may not have the same broad platform support / cross-compilation guarantees due to using external libraries.
</p>

<h3 style="margin-top: 2rem;">OpenGL</h3>

<p>
    <img src="https://user-images.githubusercontent.com/3173176/203870354-0a5d9349-02db-49d0-9666-483d15a41cbb.png" style="width: 20rem; float: right;">
    Since mach/glfw is only bindings to GLFW, you'll need to bring-your-own OpenGL library if that is how you intend to use it.
    <br/>
    <br/>
    For a OpenGL usage example, see <a href="https://github.com/hexops/mach-glfw-opengl-example">mach-glfw-opengl-example</a> - but note that it may not have the same broad platform support / cross-compilation guarantees due to using external libraries.
</p>

<h3 style="margin-top: 2rem;">WebGPU</h3>

<p>
    WebGPU requires a bit of setup code, and a WebGPU implementation is required. If you like, you can use our standalone mach/gpu bindings with the mach/gpu-dawn implementation of WebGPU and bind it to a GLFW window following <a href="https://github.com/hexops/mach-gpu/tree/main/examples">this example</a>.
    <br/>
    <br/>
    If you are considering this option, we suggest <a href="../core">Mach core</a> as it would provide you with the same functionality (Window+Input+WebGPU) with much broader platform support (e.g. you get mobile/web support in the future for free.)
</p>

## Getting started

### Adding dependency

In a `libs` subdirectory of the root of your project:

```sh
git clone https://github.com/hexops/mach-glfw
```

Then in your `build.zig` add:

```zig
...
const glfw = @import("libs/mach-glfw/build.zig");

pub fn build(b: *Builder) !void {
    ...
    exe.addPackage(glfw.pkg(b));
    try glfw.link(b, exe, .{});
}
```

### Usage

Now in your code you may import and use GLFW:

```zig
const glfw = @import("glfw");

/// Default GLFW error handling callback
fn errorCallback(error_code: glfw.Error, description: [:0]const u8) void {
    std.log.err("glfw: {}: {s}\n", .{ error_code, description });
}

pub fn main() !void {
    glfw.setErrorCallback(errorCallback);;
    if (!glfw.init(.{})) {
        std.log.err("failed to initialize GLFW: {?s}", .{glfw.getErrorString()});
        std.process.exit(1);
    }
    defer glfw.terminate();

    // Create our window
    const window = glfw.Window.create(640, 480, "Hello, mach-glfw!", null, null, .{}) orelse {
        std.log.err("failed to create GLFW window: {?s}", .{glfw.getErrorString()});
        std.process.exit(1);
    };
    defer window.destroy();

    // Wait for the user to close the window.
    while (!window.shouldClose()) {
        glfw.pollEvents();
    }
}
```

## Error handling

For details on why our GLFW bindings don't return Zig errors, see [this PR](https://github.com/hexops/mach/pull/662) - the TL;DR is that GLFW errors rarely signal a problem where your application should exit.

You should be very mindful about what you do when you encoounter a GLFW error. If it's not truly critical to the execution of your application, you should almost always just print the error and continue trying to run. This will ensure the greatest platform support across e.g. more obscure X11 compositors and Wayland. Write your code to be resilient to GLFW errors and continue running best-effort where possible.

### Overview

After making a GLFW function call, you should check errors explicitly using one of:

* `glfw.getErrorString()` - returns an error message or `null` if none present
* `glfw.getError()` - returns a Zig error or void if none is present
* `glfw.mustGetError()` - returns a Zig error or panics if none is present
* `glfw.setErrorCallback` - if you just want to log your errors (I do NOT suggest terminating your application if this callback is invoked.)

Here are some specific examples:

### Initialization

If initialization fails, your application really cannot continue, so print the detailed error message string and exit:

```zig
if (!glfw.init(.{})) {
    std.log.err("failed to initialize GLFW: {?s}", .{glfw.getErrorString()});
    std.process.exit(1);
}
```

### Creating a window

Some functions like `glfw.Window.create` return `null` in the event of an error, you can handle this by presenting the `glfw.getErrorString()` value to the user and exiting if appropriate.

### Other GLFW API calls

In general, you should be explicit about handling errors. Ask yourself: if this code fails, does my application _need_ to exit, or can I continue best-effort? If your application needs to exit because the API call was critical, then add an error check to present the problem:

```zig
glfw.foobar();
if (glfw.getErrorString()) |msg| {
    std.log.err("glfw.foobar: {s}", .{msg});
    std.process.exit(1);
}
```

Keep in mind that GLFW errors are stored per-thread. If you call a function and it produces an error and you do not retrieve it, then the next person who checks for an error will find it. This means that you may find it useful to be a good citizen by "clearing" any stored errors that you do not care about when finished calling GLFW functions, e.g. using defer:

```zig
defer getError() catch {}; // clear any errors we generated
```
