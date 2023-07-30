---
title: "Experimental libraries - Mach"
description: "Experimental Mach standalone libraries for Zig gamedev, including ones for Entity Component Systems, interacting with JavaScript via WebAssembly, audio input/output, and more."
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
images: ["/img/mach-opengraph.png"]
---

# Experimental Zig gamedev libraries

The following libraries are experimental. Some are not usable yet/we expect their APIs to change substantially, while others are near promotion to being declared stable but have a few caveats.

While libraries are unstable, they live in the Mach monorepo. Once declared stable they will be exported to a separate standalone repository.

## mach-sysaudio

<a href="https://github.com/hexops/mach/tree/main/libs/sysaudio" style="margin: auto; margin-top: 2rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/sysaudio-dark.svg">
        <img alt="mach-sysaudio" src="/assets/mach/sysaudio-light.svg" style="height: 5rem;">
    </picture>
</a>

**mach-sysaudio** is a lightweight and cross-platform abstraction over various sound drivers, providing input and output. It originally started as a port of Andrew Kelley's [libsoundio](http://libsound.io/) to Zig, but has diverged since then with e.g. the addition of WebAssembly/WebAudio support.

* Supports various backends: Alsa, PulseAudio, Jack, WASAPI, WebAudio, Dummy, and more soon)
* Supports channel layouts
* Automatic format conversion
* Device enumeration
* Ability to Connect to multiple devies
* Devices monitoring
* No buffering
* No external dependencies except for the backend libraries

**Instability reason**: API is generally solid/stable, but macOS is not yet supported ([issue](https://github.com/hexops/mach/issues/650)), we're hoping to add support for it soon and declare the library stable.

## mach-sysjs

<a href="https://github.com/hexops/mach/tree/main/libs/sysjs" style="margin: auto; margin-top: 2rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/sysjs-dark.svg">
        <img alt="mach-sysjs" src="/assets/mach/sysjs-light.svg" style="height: 5rem;">
    </picture>
</a>

**mach-sysjs** provides Zig with the ability to call from WebAssembly into JavaScript. It is similar to Go's `syscall/js` package, if you have ever worked with that.

It provides a quite nice API for interfacing with JS code, without ever leaving Zig.

**Instability reason**: API may change a bit, we're also hoping to add a reduced-overhead bindgen-like option to the library before declaring it as stable.

## mach-earcut

<a href="https://github.com/hexops/mach/tree/main/libs/earcut" style="margin: auto; margin-top: 2rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/earcut-dark.svg">
        <img alt="mach-earcut" src="/assets/mach/earcut-light.svg" style="height: 5rem;">
    </picture>
</a>

**mach-earcut** provides industrial-strength polygon triangulation

It can handle holes, twisted polygons, degeneracies and self-intersections. While it doesn't _guarantee_ correctness of triangulation, it attempts to always produce acceptable results for practical data. In effect, it is good for turning polygons into triangles for visualization.

It is faster and more correct than other libraries such as libtess, poly2tri, and others.

**Instability reason**: Nearing stability, just needs some further testing / real-world usage before declaring it as stable.

## mach-basisu

<a href="https://github.com/hexops/mach/tree/main/libs/basisu" style="margin: auto; margin-top: 2rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/basisu-dark.svg">
        <img alt="mach-basisu" src="/assets/mach/basisu-light.svg" style="height: 5rem;">
    </picture>
</a>

**mach-basisu** provides basis universal (supercompressed textures) for Zig.

**Instability reason**: Nearing stability, just needs WebAssembly compilation testing, and real-world usage before declaring it as stable.

## mach-model3d

<a href="https://github.com/hexops/mach/tree/main/libs/model3d" style="margin: auto; margin-top: 2rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/model3d-dark.svg">
        <img alt="mach-model3d" src="/assets/mach/model3d-light.svg" style="height: 5rem;">
    </picture>
</a>

**mach-model3d** provides Model3D file loading. Model3D is an up-and-coming compact, featureful, universal model format that tries to address the shortcomings of existing formats (yes, including glTF - see [their rationale](https://gitlab.com/bztsrc/model3d/#rationale).) It is a small, zero-dependency single-header C implementation and we offer bindings from Zig.

**Instability reason**: Nearing stability, just needs WebAssembly compilation testing. Already in use in the PBR and deferred-rendering Mach core examples.

## mach-ecs

<a href="https://github.com/hexops/mach/tree/main/libs/ecs" style="margin: auto; margin-top: 2rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/ecs-dark.svg">
        <img alt="mach-ecs" src="/assets/mach/ecs-light.svg" style="height: 5rem;">
    </picture>
</a>

**mach-ecs** is the Entity Component System library that we're building as part of an [in-depth blog series](https://devlog.hexops.com/categories/build-an-ecs/) from first-principles.

**Instability reason**: Major API changes and new features are expected, the library is about 1/4th the way complete. Currently only very basic usage is possible compared to other ECS libraries.
