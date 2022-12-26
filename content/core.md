---
title: "Mach Core: Window/Input/GPU, nothing else"
description: "Comparable to SDL/GLFW; but truly cross-platform. Desktop, Web (soon), and Mobile (future). Zig & C API."
draft: false
layout: "unlimited"
rss_ignore: true
---

<style>
    .p-section {
        display: flex;
        flex-direction: row;
        margin-top: 3rem;
        padding: 1rem;
        align-items: center;
        justify-content: center;
    }

    .p-section-highlight {
        margin-top: 4rem;
        margin-bottom: 2rem;
    }

    .p-section-right {
        margin-left: 3rem;
    }

    .p-section-left {
        margin-right: 3rem;
    }

    .p-img-left {
        height: 10rem;
        margin-left: 4.5rem;
    }

    .p-img-right {
        height: 10rem;
        margin-right: 4.5rem;
    }

    .animated-demo > video,
    .static-demo > img, .logo {
        width: 30rem;
    }

    .core-logo {
        display: flex;
        justify-content: center;
    }

    .core-logo > h1 {
        font-size: 42pt;
        margin: 0;
        align-self: end;
    }

    @media (max-width: 1280px) {
        .p-section {
            margin-top: 4rem;
            flex-direction: column;
        }
        .p-section-right {
            margin-left: 0;
        }
        .p-section-left {
            margin-right: 0;
        }

        .animated-demo > video,
        .static-demo > img, .logo {
            width: 20rem !important;
        }

        .core-logo > h1 {
            font-size: 24pt;
        }
    }
</style>

<div style="padding: 1rem">
    <div class="core-logo">
        <img class="logo" src="/img/mach.svg" />
        <h1>Core</h1>
    </div>
    <p>
        Mach provides an ecosystem of provides truly-cross-platform libraries
        and tools for game development in Zig called <strong>Core</strong>.
        you don't have to use the entire engine.
        All our libraries aim to have the same zero-fuss installation, cross compilation, and platform support.
        Core libraries are low-level, and just handles the cross-platform bits
        (providing you with browser, mobile, and more support in the future.)
    </p>
</div>

<div class="p-section">
    <a class="static-demo" href="https://github.com/hexops/mach/blob/main/libs/gpu">
        <img src="/img/gpu.svg">
    </a>
    <div class="p-section-right">
        <p>
            <strong>Mach GPU</strong> leverages Google Chrome's WebGPU implementation behind the scenes:
            we do some heavy lifting to give you effortless cross-compilation and make it all 'just work'
            with no hassle in under 60 seconds on Windows/Linux/macOS.
            WebGPU is an up-and-coming low-level graphics API like Vulkan, Metal, and DirectX 12.
            In the future, Mach will provide higher-level <i>Mach engine</i> examples with model rendering,
            text rendering, etc. as optional libraries on built on top. You get to pick & choose what you use!
        </p>
    </div>
</div>

<div class="p-section">
    <div class="p-section-left">
        <p>
            an <strong>Entity Component System</strong> for Zig built from first-principles.
            <h3>Design principles:</h3>
            <ul>
                <li>Clean-room implementation (author has not read any other ECS implementation code.)</li>
                <li>Solve the problems ECS solves, in a way that is natural to Zig and leverages Zig comptime.</li>
                <li>Avoid patent infringement upon Unity ECS patent claims.</li>
                <li>Fast. Optimal for CPU caches, multi-threaded, leverage comptime as much as is reasonable.</li>
                <li>Simple. Small API footprint, should be natural and fun - not like you're writing boilerplate.</li>
                <li>Enable other libraries to provide tracing, editors, visualizers, profilers, etc.</li>
            </ul>
        </p>
    </div>
    <a class="static-demo" href="https://github.com/hexops/mach/blob/main/libs/ecs">
        <img src="/img/ecs.svg">
    </a>
</div>

<div class="p-section">
    <a class="static-demo" href="https://github.com/hexops/mach/blob/main/libs/sysaudio">
        <img src="/img/sysaudio.svg">
    </a>
    <div class="p-section-right">
        <p>
            <strong>Sysaudio</strong> is a lightweight and cross-platform abstraction over various sound drivers.
            <h3>Features:</h3>
            <ul>
                <li>Supports various backends (Alsa, PulseAudio, Jack, WASAPI, WebAduio, Dummy, and more soon)</li>
                <li>Supports channel layouts</li>
                <li>Automatic format conversion</li>
                <li>No buffering</li>
                <li>Device enumeration</li>
                <li>Ability to Connect to multiple devies</li>
                <li>Devices monitoring</li>
                <li>No external dependencies except for the backend libraries</li>
            </ul>
        </p>
    </div>
</div>

<div class="p-section">
    <div class="p-section-left">
        <p>
            <strong>Sysjs</strong> gives access to the wasm-compiled environment
            to communicate with JS objects, strings, numbers, etc
        </p>
    </div>
    <a class="static-demo" href="https://github.com/hexops/mach/blob/main/libs/sysjs">
        <img src="/img/sysjs.svg">
    </a>
</div>
