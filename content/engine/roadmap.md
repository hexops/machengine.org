---
title: "Engine roadmap"
description: "There is a long road ahead, it's going to require a lot of work to get to where we are going. Here's what we're focused on soon and in the future."
draft: false
layout: "docs"
docs_type: "engine"
rss_ignore: true
---

# Engine roadmap

There is a _long_ road ahead: it's going to require a lot of work and time to get to where we are going.

We've been working on Mach for ~2 years now, primarily building out the Zig gamedev ecosystem, building [foundational packages](../../pkg) that we needed for [Mach core](../../core), and as a result we've really _just_ broken ground on the engine side of things.

Development is fairly linear, but developments _that you see_ aren't linear, we were focused on more foundational things before - but _yoday_ we're actively focused on higher-level APIs which will have more profound impacts for end-users.

We intend to accelerate our release schedule to about once every 6 months.

## v0.2 (finished)

* [x] Mach core is an actual alternative to the traditional GLFW+OpenGL or SDL combo used by people.
  * Codebase is strictly separated and usable separate from Mach _engine_.
  * Examples are decent, and a basic 2D sprite rendering example exists.
  * We feel confident about the internals, feel good about the API design overall, etc.
  * Multi-threaded rendering & input handling is resolved.
* [x] Build out the packages/bindings we need for Mach engine
  * [x] mach-sysaudio: pure-Zig low-level cross-platform audio input/output
  * [x] mach-flac: lossless audio decoding
  * [x] mach-opus: lossy audio decoding support
  * [x] mach-gamemode: Linux gamemode optimization client (rewrite in Zig)
  * [x] mach-gpu: add infrastructure for automated updates & make it the best WebGPU interface for Zig
* [x] Adopt the Zig self-hosted compiler and fully migrate to the package manager (eliminate all submodules.)
* [x] Begin prototyping engine design
  * [x] mach-ecs: prototyping & direction set for the future
  * [x] Prototype gfx2d sprite rendering ECS module / example
  * [x] Prototype gfx2d text rendering ECS module / example
* [x] New website that can hold documentation for the project going forward
* [x] Wrench automation infrastructure for managing Zig updates and other tedious time-consuming issues

## v0.3 (in progress)

- [ ] Mach engine becomes viable for basic 2D games
  - [ ] Basic text rendering ECS module
  - [ ] Basic sprite rendering ECS module
  - [ ] Basic audio rendering ECS module
  - [ ] ECS implementation begins to mature (extremely immature today)
- [ ] Basic 2D game demo
- [ ] Basic custom GUI ECS module
- [ ] Browser support
  - [ ] mach-sysjs: rewritten for code generation approach ('bindgen-like')

## Future

- [ ] Mach engine becomes viable for basic 3D games
  - [ ] Basic 3D model loading
- [ ] Custom GUI begins to mature
- [ ] Initial editor development support
- [ ] Mobile support
- [ ] Dusk (our pure-Zig WebGPU implementation) matures enough to become the default.
  - [ ] Mature Vulkan backend
  - [ ] Mature Direct3D backend
  - [ ] Mature Metal backend

