---
title: "Standard library"
description: "The Mach standard library is modular by design. Just like the Zig standard library, you pick and choose which parts to use."
draft: false
layout: "docs"
docs_type: "docs"
rss_ignore: true
---

# Standard library

The Mach standard library can be found at: [github.com/hexops/mach](https://github.com/hexops/mach) - it is [modular by design](../modularity). Just like the Zig standard library, you can choose which parts to use or not.

Thanks to Zig's lazy code evaluation and lazy dependency fetching, you really only pay for the parts you use.

## Choosing your Mach version

### 0.4 branch (not actively developed, but more stable)

The 0.4 branch is what applications like [Pixi](https://github.com/foxnne/pixi) and games like `#lordofzero` (in the Discord) are using. It uses GLFW, WebGPU, and optionally the ECS. It is [no longer in development](https://discord.com/channels/996677443681267802/996688886216523907/1259736837648416829) however.

To use this version, add the Mach dependency to your `build.zig.zon` file:

<pre><code id="zig-fetch-04">zig fetch --save https://pkg.machengine.org/mach/$LATEST_COMMIT.tar.gz
</code></pre>
<script>
fetch('https://api.github.com/repos/hexops/mach/branches/0.4', {
  method: 'GET',
  headers: {'Accept': 'application/json'}},
)
  .then(resp => resp.json())
  .then(resp => {
    let elem = document.querySelector('#zig-fetch-04');
    elem.innerHTML = elem.innerHTML.replace('$LATEST_COMMIT', resp.commit.sha);
  });
</script>

### main branch (actively developed, experimental/unstable)

This branch is where active development is happening, we are removing GLFW and WebGPU in favor of our own packages ([more details](https://discord.com/channels/996677443681267802/996688886216523907/1259736837648416829)) which means it is not stable - or may not even run - on some OS. At the time of writing Sep 30th, Windows is relatively stable, Linux might work under Wayland, and macOS is not expected to work currently.

To use this version, add the Mach dependency to your `build.zig.zon` file:

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

## Using the dependency

Then make it importable by your code in `build.zig`, e.g.:

```zig
pub fn build(b: *std.Build) void {
    // ...

    // Add Mach to our library and executable
    const mach_dep = b.dependency("mach", .{
        .target = target,
        .optimize = optimize,
    });
    lib.root_module.addImport("mach", mach_dep.module("mach"));
    exe.root_module.addImport("mach", mach_dep.module("mach"));
}
```

Now in e.g. your `src/main.zig` you can `@import("mach")`.

## (optional) Lazy dependencies

Mach's stdlib has a handful of external dependencies, downloading them all is usually not a problem. Optionally, if you want to optimize your build and only download what is absolutely neccessary, you can specify which parts of the Mach stdlib you use and have only the dependencies needed for those parts downloaded.

For example, in your build.zig you might specify:

```zig
    const mach_dep = b.dependency("mach", .{
        .target = target,
        .optimize = optimize,

        // We only use mach.core and mach.sysaudio, so only fetch the dependencies needed by those.
        .core = true,
        .sysaudio = true,
    });
```

The options are:

| Option              | Description                                                       |
| ------------------- | ----------------------------------------------------------------- |
| No option specified | Fetch all external dependencies                                   |
| `.core = true`      | Fetch external dependencies needed for `@import("mach").core`     |
| `.sysaudio = true`  | Fetch external dependencies needed for `@import("mach").sysaudio` |
| `.sysgpu = true`    | Fetch external dependencies needed for `@import("mach").sysgpu`   |

An option is only provided if that portion of the stdlib has external dependencies. Remember that Zig's lazy code evaluation effectively means time is only spent compiling the code you reference.

## Ran into trouble?

Feel free to join the [Mach Discord community](../../discord) for help.
