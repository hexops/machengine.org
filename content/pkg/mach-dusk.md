---
title: "mach dusk"
description: "Highly experimental, blazingly fast, lean & mean WebGPU implementation in Zig."
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div style="display: flex; flex-direction: column; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/dusk-full-dark.svg">
        <img alt="mach-dusk" src="/assets/mach/dusk-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <span>
        <a href="https://github.com/hexops/mach-dusk">GitHub repository</a> | <a href="https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Adusk">Issue tracker</a>
    </span>
</div>

Highly experimental, blazingly fast, lean & mean WebGPU implementation in Zig.

## Experimental

This is an **experimental** project according to [our stability guarantees](../../about/stability):

> When a project has an experimental warning, it means all bets are off. You should carefully read the warning to understand why the project is experimental, and assume the worst.

**Tracking issue:** https://github.com/hexops/mach/issues/966

## Goals

* Written in Zig, be the leanest and meanest WebGPU implementation in the books (ability to turn off safety checks, bounds checks in shaders, etc.)
* Custom WGSL shader parser, AST, compiler, etc.
  * Modern backends:
    * Direct3D (Windows)
    * Vulkan (Linux, Android)
    * Metal (macOS, iOS)
  * (long-term) Custom Zig-like shader syntax
  * (long-term) Feature extensions (bindless, ray tracing, etc.)

## Non-goals

* Patching or working around bad or insecure graphics drivers (browsers do this.)
* Ultra-wide hardware support; we won't maintain OpenGL/GLES or software rendering backends, nor [compatibility mode](https://github.com/gpuweb/gpuweb/issues/4266))
* BYOSL (bring-your-own-shading-language)
