---
title: "Standalone packages"
description: "Mach provides an ecosystem of 100% standalone, high-quality Zig gamedev packages, and they all feature zero-fuss installation, broad platform support, and cross-compilation at the flip of a switch."
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

# Standalone Zig gamedev packages

Mach provides an ecosystem of 100% standalone, high-quality Zig gamedev packages - and they all feature <a href="../about/goals#zero-fuss-installation">zero-fuss installation</a>, <a href="../about/goals#seamless-cross-compilation">cross-compilation</a> at the flip of a switch, and <a href="../about/platforms">broad platform support</a>.

## The ecosystem

<div style="text-align: center; margin-top: 1rem;">
    <a href="/pkg/mach-gpu" class="img-link">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/gpu-dark.svg">
            <img alt="mach-gpu" src="/assets/mach/gpu-light.svg" style="height: 3rem; margin-right: 1rem; margin-top: 0.5rem;">
        </picture>
    </a>
    <a href="/pkg/mach-ecs" class="img-link">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/ecs-dark.svg">
            <img alt="mach-ecs" src="/assets/mach/ecs-light.svg" style="height: 3rem; margin-right: 1rem; margin-top: 0.5rem;">
        </picture>
    </a>
    <a href="/pkg/mach-sysaudio" class="img-link">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/sysaudio-dark.svg">
            <img alt="mach-sysaudio" src="/assets/mach/sysaudio-light.svg" style="height: 3rem; margin-right: 1rem; margin-top: 0.5rem;">
        </picture>
    </a>
    <a href="/pkg/mach-sysjs" class="img-link">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/sysjs-dark.svg">
            <img alt="mach-sysjs" src="/assets/mach/sysjs-light.svg" style="height: 3rem; margin-right: 1rem; margin-top: 0.5rem;">
        </picture>
    </a>
    <a href="/pkg/mach-glfw" class="img-link">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/glfw-dark.svg">
            <img alt="mach-glfw" src="/assets/mach/glfw-light.svg" style="height: 3rem; margin-right: 1rem; margin-top: 0.5rem;">
        </picture>
    </a>
    <a href="/pkg/mach-freetype" class="img-link">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/freetype-dark.svg">
            <img alt="mach-freetype" src="/assets/mach/freetype-light.svg" style="height: 3rem; margin-right: 1rem; margin-top: 0.5rem;">
        </picture>
    </a>
    <a href="/pkg/mach-gamemode" class="img-link">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/gamemode-dark.svg">
            <img alt="mach-gamemode" src="/assets/mach/gamemode-light.svg" style="height: 3rem; margin-right: 1rem; margin-top: 0.5rem;">
        </picture>
    </a>
    <a href="/pkg/mach-basisu" class="img-link">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/basisu-dark.svg">
            <img alt="mach-basisu" src="/assets/mach/basisu-light.svg" style="height: 3rem; margin-right: 1rem; margin-top: 0.5rem;">
        </picture>
    </a>
    <a href="/pkg/mach-model3d" class="img-link">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/model3d-dark.svg">
            <img alt="mach-model3d" src="/assets/mach/model3d-light.svg" style="height: 3rem; margin-right: 1rem; margin-top: 0.5rem;">
        </picture>
    </a>
    <a href="/pkg/mach-sysgpu" class="img-link">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/sysgpu-dark.svg">
            <img alt="mach-sysgpu" src="/assets/mach/sysgpu-light.svg" style="height: 3rem; margin-right: 1rem; margin-top: 0.5rem;">
        </picture>
    </a>
    <a href="/pkg/mach-flac" class="img-link">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/flac-dark.svg">
            <img alt="mach-flac" src="/assets/mach/flac-light.svg" style="height: 3rem; margin-right: 1rem; margin-top: 0.5rem;">
        </picture>
    </a>
    <a href="/pkg/mach-opus" class="img-link">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/opus-dark.svg">
            <img alt="mach-opus" src="/assets/mach/opus-light.svg" style="height: 3rem; margin-right: 1rem; margin-top: 0.5rem;">
        </picture>
    </a>
</div>

## Who are these for?

Generally speaking, if you are using _Mach engine_ you won't be using these - as they require you to wire up everything yourself. Instead, you would be using _engine modules_ which would let you more seamlessly integrate these into your project.

If you use [Mach core](../core/) - or are just looking for high-quality standalone Zig packages, then you'd consider using these.

Additionally, we provide [C libraries & headers packaged via the Zig build system](c) which are not Zig wrappers but rather just build the respective C library and package them via the Zig build system.

## C bindings vs. pure Zig

We're not just aimlessly wrapping C libraries, here. We use C libraries generally when:

a. It is a low-level library that most Mach users would have zero need to dive into the internals of.
b. It is a clear choice, where writing our own in Zig would take a very long time.
c. It solves one problem, and solves it well. e.g. we would use GLFW for window management, not SDL, because SDL solves more than one problem.

In general, we prefer to write things in Zig and have pure-Zig options - because that means you don't need to dive into a C/C++ codebase when things go wrong or you want to change things. Of course, this must be balanced with the reality of writing complex software.

We _especially_ avoid high-level C/C++ libraries, such as e.g. Dear Imgui, because in such cases it would be very tempting to want to dive into the internals and adjust things - and we don't want our users to have to dive into a C/C++ codebase to make changes. In these cases, we intentionally make a choice to write a pure-Zig version instead, even though the initial experience results in less features and capabilities. It is the short-term price we pay to have a better long-term future.
