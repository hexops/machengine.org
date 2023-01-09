---
title: "Mach core: standalone libraries"
description: "Mach provides a handful of standalone libraries for Zig game development-including ones for WebGPU, Entity Component Systems, interacting with JavaScript via WebAssembly, audio input/output, and much more."
draft: false
layout: "docs"
rss_ignore: true
---

<style>
h2 {
    visibility: hidden;
    height: 0;
    margin: 0;
    padding: 0;
}
</style>

<h1 style="text-align: center;">Zig gamedev libraries</h1>

Separately from Mach core (and entirely optional) are a handful of useful standalone zig gamedev libraries that we provide:

## sysaudio

<a href="https://github.com/hexops/mach/tree/main/libs/sysaudio" style="margin: auto; margin-top: 2rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/media/sysaudio/logo_dark.svg">
        <img alt="mach/sysaudio" src="/assets/media/sysaudio/logo_light.svg" style="height: 5rem;">
    </picture>
</a>

**Experimental - mach/sysaudio** is a lightweight and cross-platform abstraction over various sound drivers, providing input and output. It originally started as a port of Andrew Kelley's [libsoundio](http://libsound.io/) to Zig, but has diverged since with e.g. WebAssembly/WebAudio support.

* Supports various backends: Alsa, PulseAudio, Jack, WASAPI, WebAudio, Dummy, and more soon)
* Supports channel layouts
* Automatic format conversion
* Device enumeration
* Ability to Connect to multiple devies
* Devices monitoring
* No buffering
* No external dependencies except for the backend libraries
* **Important**: macOS is [not yet supported](https://github.com/hexops/mach/issues/650), but we're hoping to add this soon.

## sysjs

<a href="https://github.com/hexops/mach/tree/main/libs/sysjs" style="margin: auto; margin-top: 2rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/media/sysjs/logo_dark.svg">
        <img alt="mach/sysjs" src="/assets/media/sysjs/logo_light.svg" style="height: 5rem;">
    </picture>
</a>

**Experimental - mach/sysjs** provides Zig with the ability to call from WebAssembly into JavaScript. It is similar to Go's `syscall/js` package, if you have ever worked with that.

It provides a quite nice API for interfacing with JS code, without ever leaving Zig.

## ecs

<a href="https://github.com/hexops/mach/tree/main/libs/ecs" style="margin: auto; margin-top: 2rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/media/ecs/logo_dark.svg">
        <img alt="mach/ecs" src="/assets/media/ecs/logo_light.svg" style="height: 5rem;">
    </picture>
</a>

**Experimental - mach/ecs** is the Entity Component System library that we're building as part of an [in-depth blog series](https://devlog.hexops.com/categories/build-an-ecs/) from first-principles.

### Other libraries

* https://github.com/hexops/mach-freetype
* https://github.com/hexops/fastfilter
* https://github.com/hexops/mach/tree/main/libs/basisu
* https://github.com/hexops/mach/tree/main/libs/earcut
* https://github.com/hexops/mach/tree/main/libs/gamemode
* https://github.com/hexops/mach/tree/main/libs/model3d
