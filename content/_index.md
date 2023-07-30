---
title: "Mach"
description: "Zig game engine & graphics toolkit for building high-performance, native, truly-cross-platform games, visualizations & desktop/mobile apps."
draft: false
rss_ignore: true
layout: "home"
override_css: "layouts/home.scss"
images: ["/img/mach-opengraph.png"]
---

<style>
.p-section {
    display: flex;
    flex-direction: row;
    padding-top: 3rem;
    margin-top: 0;
    align-items: center;
    justify-content: center;
}
.p-section:last-child {
    padding-bottom: 3rem;
}
.p-section-right {
    margin-left: 3rem;
}
.p-img-left {
    height: 10rem;
    margin-left: 4.5rem;
}
.p-img-right {
    height: 10rem;
    margin-right: 4.5rem;
}
.p-img-small {
    height: 6rem;
}
.p-logo { margin-right: 3rem; margin-top: 2rem; }
.p-logo>img {
    height: 10rem;
    width: 100%;
}
.p-early-stages-left {
    text-align: right;
    padding-right: 2rem;
    border-right: 1px solid gray;
    height: 12rem;
    justify-content: center;
    display: flex;
    flex-direction: column;
}
.p-early-stages-right {
    text-align: left;
}

.contributors img,
.sponsors img {
    width: 3rem;
    height: 3rem;
    margin: .25rem;
}

@media (max-width:700px) {
    .p-logo { margin: auto; margin-top: 0; margin-bottom: -2rem; }
    .p-logo img { margin-top: -1rem; }
    .p-section { margin-top: 4rem; flex-direction: column; }
    .p-section h2 { text-align: center; }
    .p-section-right { margin-left: 0; }
    .p-section small { margin: 0; display: block; text-align: center; }
    .p-img-left { margin: auto; margin-top: 2rem; margin-bottom: -1rem; height: 6rem; }
    .p-img-right { margin: auto; margin-bottom: 2rem; margin-top: -1rem; height: 6rem; }
    .p-section.contributors>div>div,
    .p-section.sponsors>div>div {
        text-align: center !important;
    }
    .p-section.contributors>img,
    .p-section.sponsors>img {
        position: relative;
        left: -1rem;
        top: 3rem;
    }
    .p-early-stages-left {
        border: 0;
        padding: 0;
        height: auto;
    }
    .p-early-stages-left>p {
        font-size: 83%; /* <small> */
    }
    .p-section.get-involved > div {
        width: auto !important;
    }
    .p-section.get-involved > div > p {
        text-align: center;
    }
    .p-section.get-involved > div:nth-child(2) {
        margin: auto !important;
        margin-top: 2rem !important;
    }
    .p-section iframe {
        width: 100%;
        height: 15rem;
    }
}

.choose-your-journey {
    display: flex;
    flex-direction: column;
    height: 1rem;
    min-height: 42rem;
    max-width: 100%;
    overflow: hidden;
}
.choose-your-journey>.options {
    display: flex;
    flex-direction: row;
    justify-content: center;
}
.choose-your-journey .engine,
.choose-your-journey .core {
    display: flex;
    flex-direction: column;
}
.choose-your-journey .content>h1 {
    margin-top: 3rem;
}
.choose-your-journey .content>h2 {
    margin-bottom: 1rem;
}
.choose-your-journey .content>a>video {
    width: 15rem;
    margin-top: 1rem;
    margin-bottom: 1rem;
    box-shadow: 0 0 0rem #0a1619;
    animation-duration: 2s;
    animation-iteration-count: 1;
    animation-name: boxShadowFadeIn;
    animation-timing-function: ease-out;
    animation-fill-mode: forwards;
}
@keyframes boxShadowFadeIn {
    0% {
        box-shadow: 0 0 0rem #0a1619;
    }
    100% {
        box-shadow: 0 0 3rem #0a1619;
    }
}
.choose-your-journey .engine>.content,
.choose-your-journey .core>.content {
    display: flex;
    flex-direction: column;
    text-align: left;
    margin-top: 1rem;
}
.choose-your-journey .core>.content {
    align-items: flex-end;
    position: relative;
    left: 15%;
    margin-right: 2rem;
    align-self: start;
}
.choose-your-journey .engine>.content {
    margin-left: 2rem;
    align-self: end;
    position: relative;
    right: 10%;
}
.choose-your-journey .engine {
}
.choose-your-journey .core {
}
img.p-community-icon {
    height: 100%;
    /* https://codepen.io/sosuke/pen/Pjoqqp */
    filter: invert(100%) sepia(100%) saturate(0%) hue-rotate(143deg) brightness(105%) contrast(104%);
}
a.p-community-icon {
    padding: 1rem;
    display: inline-block;
    height: 3rem;
    text-decoration: none;
}

.p-section .big-button:before {
    background: rgba(255, 255, 255, 0.3);
}

.always-open-source>div {
    padding-left: 0;
}
.always-open-source img {
    border-radius: 100%;
    height: 7.5rem;
    margin-right: 3rem;
}

.content>h1>a {
    text-decoration: none;
}

.choose-journey {
    display: flex;
    align-items: center;
    flex-direction: column;
}
.choose-journey .primary,
.choose-journey .secondary {
	animation-iteration-count: 1;
	animation-timing-function: ease-out;
	animation-duration: 2s;
    opacity: 1;
}
.choose-journey .secondary {
    display: flex;
    flex-direction: row;
    position: relative;
    top: -8rem;
    opacity: 0;
    visibility: none;
    z-index: -1;
    width: 29rem;
	animation-duration: 0.25s;
    margin: 0;
}
.choose-journey .secondary.big-button-false-before::before {
    margin-top: 1rem;
}
.choose-journey .secondary .big-button {
    flex: 1;
    text-align: center;
    justify-content: center;
}
.choose-journey .secondary .big-button:first-of-type {
    margin-left: -3rem;
}
.choose-journey .secondary .big-button:last-of-type {
    margin-right: -3rem;
}
.choose-journey .secondary .big-button::before {
    content: none;
}

@keyframes chooseJourneyFadeIn {
	0% {
		opacity: 0;
        visibility: none;
        z-index: -1;
	}
	100% {
		opacity: 1;
        visibility: visible;
        z-index: 1;
	}
}
@keyframes chooseJourneyFadeOut {
	0% {
		opacity: 1;
        visibility: visible;
	}
	100% {
		opacity: 0;
        visibility: none;
	}
}

.community {
    background: rgb(255,255,255, 0.1);
    background: linear-gradient(180deg, rgba(255,255,255,0.25) 0%, rgba(255,255,255,0) 100%);
}

.choose-your-journey .videos {
    margin-top: -7.8rem;
}
.choose-your-journey .videos video {
    margin: 0;
    padding: 0;
}
</style>

<div class="choose-your-journey">
    <div style="display: flex; flex-direction: row; justify-content: space-around; margin: 6rem; margin-top: 7rem; margin-bottom: 4rem; text-align: left;">
        <div>
            <h1 style="font-size: 600%; padding: 0; margin: 0;">Mach</h1>
            <h2 style="font-size: 150%; padding: 0; margin-top: -1rem;">Zig game engine & graphics toolkit</h2>
            <p style="font-size: 100%; padding: 0; margin: 0; margin-top: 2rem; max-width: 36rem;">For building high-performance, truly cross-platform, robust & modular games, visualizations, and desktop/mobile GUI apps.</p>
            <p><a href="#">What's new in v0.2?</a></p>
        </div>
        <div>
            <a href="/core-example/deferred-rendering.mp4">
                <video height="300px" autoplay loop muted>
                <source src="/core-example/deferred-rendering.mp4" type="video/mp4">
                </video>
            </a>
        </div>
    </div>
    <div class="choose-journey" style="margin-bottom: 3rem; margin-top: 0rem;">
        <a href="#" class="big-button primary" onclick="chooseJourney(event)">
            <img src="/img/wrench.svg">
            Choose your journey
        </a>
        <div class="secondary big-button-false-before">
            <a href="/engine" class="big-button glass-hover">Engine</a>
            <a href="/core" class="big-button glass-hover">Core</a>
        </div>
    </div>
</div>


<div class="color-fg">
    <div class="p-section glass" style="height: 6rem; box-shadow: 0 0 3rem black; padding-bottom: 1rem; padding-top: 1rem; margin-top: 0; clip-path: inset(0 0 -10rem 0)">
        <a href="https://ziglang.org">
            <img style="float: left; height: 5rem; margin-right: 1rem; margin-top: 0.5rem;" class="p-image-left" src="/img/zig-mark.svg">
        </a>
        <h1 style="margin-top: 0;">Built with love, hard-work & Zig</h1>
    </div>
    <div class="p-section color-bg">
        <p style="width: 39rem; border-left: 2px solid black; border-right: 2px solid black; text-align: center; padding: 1rem; padding-top: 0; padding-bottom: 0; margin-top: 0;"><a href="https://ziglang.org">Zig</a> is a general-purpose simple programming language featuring compile-time code execution, blazing-fast compilation speeds, and bare-metal performance.</p>
    </div>
    <div class="p-section color-bg">
        <a href="/core-example/textured-cube.mp4" class="p-section-right">
            <video height="300px" autoplay loop muted>
            <source src="/core-example/textured-cube.mp4" type="video/mp4">
            </video>
        </a>
        <div class="p-section-right">
            <div style="text-align: left;">
                <h2>On your machine in just ~60 seconds</h2>
                <p style="margin-left: 1rem; display: inline-block; width: 35rem;"><a href="/about/goals#zero-fuss-installation">Zero system dependencies</a> to slow you down; only <a href="https://github.com/hexops/mach#supported-zig-version">zig nightly</a> is needed, we build and package the few relevant dependencies on our own.<br><br>To run on your machine:</small>
            </div>
            <div>
<code><pre class="code">
$ git clone --recursive https://github.com/hexops/mach-core
$ cd mach-core/
$ zig build run-textured-cube
</pre></code>
                <small>Requires <a href="https://github.com/hexops/mach#supported-zig-version">this Zig nightly version</a> | <a href="/about/known-issues">known issues</a></small>
    </small>
            </div>
        </div>
    </div>
    <div class="p-section color-bg">
        <div style="text-align: left; max-width: 30rem;">
            <h2>Effortless cross-compilation</h2>
            <p>Cross-compile to any OS at the flip of a switch. WebAssembly, Android & iOS coming soon.</p>
<code><pre class="code">
<strong>$</strong> zig build -Dtarget=x86_64-windows
<strong>$</strong> zig build -Dtarget=x86_64-linux-gnu
<strong>$</strong> zig build -Dtarget=x86_64-macos
<strong>$</strong> zig build -Dtarget=aarch64-macos
</pre></code>
        </div>
        <a href="https://user-images.githubusercontent.com/3173176/184556247-6e039490-99ee-48f4-91b4-d2cfd7a7f847.mp4" class="p-section-right">
            <video height="300px" autoplay loop muted>
            <source src="https://user-images.githubusercontent.com/3173176/184556247-6e039490-99ee-48f4-91b4-d2cfd7a7f847.mp4" type="video/webm">
            </video>
        </a>
        <!-- <img class="p-img-left auto-color" src="/img/cpu.svg"></img> -->
    </div>
    <div class="p-section color-bg">
        <img class="p-img-right auto-color" style="height: 12rem; margin-right: 1rem;" src="/img/penguin.svg"></img>
        <div style="text-align: left;" class="p-section-right">
            <h2>First-class Linux support</h2>
            <p>Linux is a first-class target for us, with Vulkan, OpenGL/GLES fallbacks, support for both X11 and Wayland in the same binary via runtime detection, and <a href="https://github.com/FeralInteractive/gamemode">gamemode</a> optimization support out of the box.</p>
            <p>From mesa drivers-to your experimental compositor (and broken vsync implementation), we'll make it run well.</p>
        </div>
    </div>
</div>


<div class="color-fg" style="clip-path: inset(0 0 -1rem 0)">
    <div class="p-section glass bright" style="height: 6rem; box-shadow: 0 0 3rem black; padding-bottom: 1rem; padding-top: 1rem; margin-top: 0;">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/img/core-dark.svg">
            <img alt="mach-glfw" src="/img/core-light.svg" style="float: left; height: 5rem; margin-right: 1rem; margin-top: -1rem; margin-bottom: -1rem;" class="p-image-left">
        </picture>
        <h1 style="margin-top: 0; text-align: left;">Mach core: window+input+GPU</h1>
    </div>
    <div class="p-section color-bg">
        <div style="text-align: left;">
            <h2>Mach core: Low-level window+input+GPU</h2>
            <p><a href="/core"><em>Mach core</em></a> provides a window, input, GPU, and <em>nothing else.</em></p>
            <p>Truly cross-platform, it supports desktop today, WebAssembly (soon) and Mobile (future) using the same unified API.</p>
            <p>Today, it is available to use via Zig. Support for other languages is planned in the future via a C ABI.</p>
        </div>
        <a href="/core-example/two-cubes.mp4" class="p-section-right">
            <video height="300px" autoplay loop muted>
            <source src="/core-example/two-cubes.mp4" type="video/mp4">
            </video>
        </a>
    </div>
    <div class="p-section color-bg">
        <a href="/core-example/instanced-cube.mp4">
            <video height="300px" autoplay loop muted>
            <source src="/core-example/instanced-cube.mp4" type="video/mp4">
            </video>
        </a>
        <div style="text-align: left;" class="p-section-right">
            <h2>Powerful, multi-threaded, efficient</h2>
            <p>The power of Vulkan/DirectX/Metal in a unified, concise, modern graphics API (including GPU compute) by using Google Chrome's WebGPU implementation natively as a graphics abstraction layer.</p>
            <p>mach-core handles rendering and input on separate threads, for butter-smooth window resizing and mid-frame input handling should you desire.</p>
            <p>Linux <a href="https://github.com/FeralInteractive/gamemode">gamemode</a> optimizations enabled by default (optional.)</p>
        </div>
    </div>
    <div class="p-section color-bg">
        <div style="text-align: center; max-width: 65rem;">
            <a href="/pkg">
                <h2 style="margin-top: 0; text-align: center;">Standalone libraries</h2>
            </a>
            <p>Mach additionally provides some of the highest-quality standalone gamedev libraries in the Zig ecosystem, including:</p>
            <br/>
            <a href="/pkg/gpu" class="img-link">
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
            <a href="/pkg/mach-earcut" class="img-link">
                <picture>
                    <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/earcut-dark.svg">
                    <img alt="mach-earcut" src="/assets/mach/earcut-light.svg" style="height: 3rem; margin-right: 1rem; margin-top: 0.5rem;">
                </picture>
            </a>
        </div>
    </div>
</div>


<div class="color-fg" style="clip-path: inset(0 0 -1rem 0)">
    <div class="p-section glass bright-2" style="height: 6rem; box-shadow: 0 0 3rem black; padding-bottom: 1rem; padding-top: 1rem; margin-top: 0;">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/media/mach/icon_dark.svg">
            <img alt="Mach" style="height: 5rem; margin-right: 1rem; padding-top: 3rem; margin-top: -3.5rem; margin-bottom: -1rem;" src="/assets/media/mach/icon_light.svg">
        </picture>
        <h1 style="margin-top: 0; text-align: left;">Mach engine (coming soon)</h1>
    </div>
    <div class="p-section color-bg">
        <p style="width: 39rem; border-left: 2px solid black; border-right: 2px solid black; text-align: left; padding: 1rem; padding-top: 0; padding-bottom: 0; margin-top: 0;">Mach engine is <strong>not ready for use yet and is in the early-stages of development.</strong></p>
    </div>
    <div class="p-section color-bg">
        <div style="text-align: left;">
            <h2>Competitive with other engines</h2>
            <p>Our ultimate aim is for <a href="doc/engine">Mach engine</a> to be a full modern engine, with a full GUI editor and all. A custom UI library, rendering engine, physics & more are all in scope and will be built out incrementally over the coming years.
            </p>
        </div>
        <img class="p-img-left auto-color" src="/img/puzzle_heart.svg"></img>
    </div>
    <div class="p-section color-bg">
        <img class="p-img-right auto-color" src="/img/thought_bubble.svg" style="height: 12rem; margin-right: 1rem;"></img>
        <div style="text-align: left;">
            <h2>Deeply rooted in modularity</h2>
            <p>Unlike the monolithic engines of today, we aim for Mach to be deeply modular, data & tooling driven. Essentially, our entity component system will be more opinionated than others and will employ a unique message passing system, which will enable deep editor integration, debug tooling, and more. The ECS will act as a shared integration point for _modules_, which will all be optional, so that you can easily plug-and-play different modules for making UIs, rendering 2D sprites, 3D models, physics, etc.</p>
        </div>
    </div>
</div>

<div class="community">
    <div class="p-section always-open-source">
        <div class="card">
            <a href="https://github.com/slimsag">
                <img class="p-img-left p-img-small" src="/img/slimsag-profile.png">
            </a>
            <div style="text-align: left;">
                <h2>Open source, always & forever</h2>
                <small style="margin-left: 1rem;">Apache or MIT licensed, at your choosing.</small>
                <p>There are few things in life I am more passionate about than Mach. I've been working on it <a href="https://devlog.hexops.com/2021/i-write-code-100-hours-a-week/">double-time</a> for over two years now, and dreaming of it for a decade before that. Today, I am building my first real game using it and I'm excited to explore how much more intuitive gamedev tooling can be.</p>
                <p>FOSS <a href="https://devlog.hexops.com/2021/increasing-my-contribution-to-zig-to-200-a-month#i-grew-up-playing-linux-games-like-mania-drive">is in my roots</a> and I believe we should own our tools, they should empower <em>us</em>-not be part of <a href="https://kristoff.it/blog/the-open-source-game/">the 'open source' game</a> which is all too prevelant today (even among 'open source' engines.) Mach needs to be for people like you and me-it needs to genuinely be <a href="https://softwareyoucan.love">software you can love</a>.</p>
                <p>My dream is one day to live a simple, modest, future earning a living building Mach for you and creating high-quality games for everyone. Please consider <a href="https://github.com/sponsors/slimsag">sponsoring my work</a>!</p>
                <p><small><em>- <a href="https://github.com/slimsag">Stephen Gutekanst</a>, BDFL of Mach</em></small></p>
            </div>
        </div>
    </div>
    <div class="p-section" style="margin-top: 1rem;">
        <img class="p-img-right" style="height: 20rem; margin-right: 2rem;" src="/img/wrench_rocket.svg">
        <div class="card" style="width: 30rem; display: block;">
            <h1 style="margin-top: 0;">Community</h1>
            <a href="https://github.com/hexops/mach" class="p-community-icon glass-link">
                <img alt="GitHub" class="p-community-icon" src="/img/github.svg">
            </a>
            <a href="https://discord.gg/XNG3NZgCqp" class="p-community-icon glass-link">
                <img alt="Discord" class="p-community-icon" src="/img/discord.svg">
            </a>
            <p>There's plenty to do, so if you're eager to get involved please join the community, say hello, check out the code and see if you can contribute!</p>
        </div>
    </div>
</div>
<div style="margin-top: 3rem;">
    <div class="p-section contributors">
        <div style="max-width: 50rem; width: 100%;">
            <h2>Contributors</h2>
            <div style="text-align: left; margin-top: 1rem;">
                <!--
                    This list is derived from:
                        https://github.com/hexops/mach/graphs/contributors
                        https://github.com/hexops/mach-examples/graphs/contributors
                    Anyone with 15+ commits, and who wishes to be featured here, may be.
                -->
                <a href="https://github.com/alichraghi"><img src="https://images.weserv.nl/?url=github.com/alichraghi.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a>
                <a href="https://github.com/iddev5"><img src="https://images.weserv.nl/?url=github.com/iddev5.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a>
                <a href="https://github.com/InKryption"><img src="https://images.weserv.nl/?url=github.com/InKryption.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a>
                <a href="https://github.com/PiergiorgioZagaria"><img src="https://images.weserv.nl/?url=github.com/PiergiorgioZagaria.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a>
                <a href="https://github.com/silversquirl"><img src="https://images.weserv.nl/?url=github.com/silversquirl.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a>
                <a href="https://github.com/kdchambers"><img src="https://images.weserv.nl/?url=github.com/kdchambers.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a>
            </div>
        </div>
    </div>
    <div class="p-section sponsors">
        <div>
            <h2>Sponsors</h2>
            <div style="max-width: 50rem; text-align: left; margin-top: 1rem;">
                <!-- tier2 --><a href="https://github.com/tauoverpi"><img src="https://images.weserv.nl/?url=github.com/tauoverpi.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jamii"><img src="https://images.weserv.nl/?url=github.com/jamii.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/ziglang"><img src="https://images.weserv.nl/?url=github.com/ziglang.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/shintales"><img src="https://images.weserv.nl/?url=github.com/shintales.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/m3talsmith"><img src="https://images.weserv.nl/?url=github.com/m3talsmith.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/mitchellh"><img src="https://images.weserv.nl/?url=github.com/mitchellh.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/dzrw"><img src="https://images.weserv.nl/?url=github.com/dzrw.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/davidroman0O"><img src="https://images.weserv.nl/?url=github.com/davidroman0O.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/batiati"><img src="https://images.weserv.nl/?url=github.com/batiati.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/arsdragonfly"><img src="https://images.weserv.nl/?url=github.com/arsdragonfly.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><!-- tier2 --><!-- tier1 --><a href="https://github.com/mattnite"><img src="https://images.weserv.nl/?url=github.com/mattnite.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/andrewrk"><img src="https://images.weserv.nl/?url=github.com/andrewrk.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/kristoff-it"><img src="https://images.weserv.nl/?url=github.com/kristoff-it.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/TommiSinivuo"><img src="https://images.weserv.nl/?url=github.com/TommiSinivuo.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jayschwa"><img src="https://images.weserv.nl/?url=github.com/jayschwa.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jacobsandlund"><img src="https://images.weserv.nl/?url=github.com/jacobsandlund.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jorangreef"><img src="https://images.weserv.nl/?url=github.com/jorangreef.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/karelp"><img src="https://images.weserv.nl/?url=github.com/karelp.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/ifreund"><img src="https://images.weserv.nl/?url=github.com/ifreund.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/shritesh"><img src="https://images.weserv.nl/?url=github.com/shritesh.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/nickcernis"><img src="https://images.weserv.nl/?url=github.com/nickcernis.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/user01"><img src="https://images.weserv.nl/?url=github.com/user01.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/silversquirl"><img src="https://images.weserv.nl/?url=github.com/silversquirl.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/sdnts"><img src="https://images.weserv.nl/?url=github.com/sdnts.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/teknico"><img src="https://images.weserv.nl/?url=github.com/teknico.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/LostKobrakai"><img src="https://images.weserv.nl/?url=github.com/LostKobrakai.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jagt"><img src="https://images.weserv.nl/?url=github.com/jagt.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/ChrisGute"><img src="https://images.weserv.nl/?url=github.com/ChrisGute.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/dylanmcdiarmid"><img src="https://images.weserv.nl/?url=github.com/dylanmcdiarmid.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/MEATANDMEAT"><img src="https://images.weserv.nl/?url=github.com/MEATANDMEAT.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/johnburton"><img src="https://images.weserv.nl/?url=github.com/johnburton.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/ryupold"><img src="https://images.weserv.nl/?url=github.com/ryupold.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/hryx"><img src="https://images.weserv.nl/?url=github.com/hryx.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/r4gus"><img src="https://images.weserv.nl/?url=github.com/r4gus.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/kooparse"><img src="https://images.weserv.nl/?url=github.com/kooparse.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/Manuzor"><img src="https://images.weserv.nl/?url=github.com/Manuzor.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/peartreegames"><img src="https://images.weserv.nl/?url=github.com/peartreegames.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/C-BJ"><img src="https://images.weserv.nl/?url=github.com/C-BJ.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/gegogi"><img src="https://images.weserv.nl/?url=github.com/gegogi.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><!-- tier1 -->
            </div>
        </div>
    </div>
</div>
<script>
function chooseJourney(e) {
    e.preventDefault();
    document.querySelector('.choose-journey .primary').style.setProperty('animation-name', 'chooseJourneyFadeOut');
    document.querySelector('.choose-journey .secondary').style.setProperty('animation-name', 'chooseJourneyFadeIn');
}
</script>