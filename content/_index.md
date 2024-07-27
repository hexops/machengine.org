---
title: "Mach"
description: "Zig game engine & graphics toolkit for building high-performance, native, truly-cross-platform games, visualizations & desktop/mobile apps."
draft: false
rss_ignore: true
layout: "home"
override_css: "layouts/home.scss"
images: ["img/mach-opengraph.png"]
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
    <div style="display: flex; flex-direction: row; justify-content: space-around; margin: 6rem; margin-top: 6rem; margin-bottom: 4rem; text-align: left;">
        <div>
            <h1 style="font-size: 600%; padding: 0; margin: 0;">Mach</h1>
            <h2 style="font-size: 150%; padding: 0; margin-top: -1rem;">Zig game engine & graphics toolkit</h2>
            <p style="font-size: 100%; padding: 0; margin: 0; margin-top: 2rem; max-width: 36rem;">For building high-performance, truly cross-platform, robust & modular games, visualizations, and desktop/mobile GUI apps.</p>
            <p><a href="https://devlog.hexops.com/2024/mach-v0.3-released/">What's new in v0.3?</a></p>
        </div>
        <div>
            <a href="https://media.machengine.org/core/example/textured-cube.mp4">
                <video height="300px" autoplay loop muted>
                <source src="https://media.machengine.org/core/example/textured-cube.mp4" type="video/mp4">
                </video>
            </a>
        </div>
    </div>
    <div class="choose-journey" style="margin-bottom: 3rem; margin-top: 0rem;">
        <a href="/docs" class="big-button primary" onclick="chooseJourney(event)">
            Get started
        </a>
    </div>
</div>


<div class="color-fg">
    <div class="p-section glass" style="min-height: 6rem; box-shadow: 0 0 3rem black; padding-bottom: 1rem; padding-top: 1rem; margin-top: 0; clip-path: inset(0 0 -10rem 0)">
        <a href="https://ziglang.org">
            <img style="float: left; height: 5rem; margin-right: 1rem; margin-top: 0.5rem;" class="p-img-left" src="/img/zig-mark.svg">
        </a>
        <h1 style="margin-top: 0;">Built with love, hard-work & Zig</h1>
    </div>
    <div class="p-section color-bg">
        <p style="max-width: 39rem; border-left: 2px solid black; border-right: 2px solid black; text-align: center; padding: 1rem; padding-top: 0; padding-bottom: 0; margin-top: 0;"><a href="https://ziglang.org">Zig</a> is a general-purpose simple programming language featuring compile-time code execution, blazing-fast compilation speeds, and bare-metal performance.</p>
    </div>
    <div class="p-section color-bg">
        <a href="https://media.machengine.org/core/example/textured-cube.mp4" class="p-section-right">
            <video height="300px" autoplay loop muted>
            <source src="https://media.machengine.org/core/example/textured-cube.mp4" type="video/mp4">
            </video>
        </a>
        <div class="p-section-right">
            <div style="text-align: left;">
                <h2>Get started in ~60 seconds</h2>
                <p style="margin-left: 1rem; display: inline-block; max-width: 35rem;"><a href="/about/goals#zero-fuss-installation">Zero system dependencies</a> to slow you down; only <a href="about/zig-version">zig</a> is needed, we build and package the few relevant dependencies on our own.<br><br>To run on your machine:</small>
            </div>
            <div>
<pre class="code" tabindex=0 style="color:#f8f8f2;background-color:#272822;-moz-tab-size:4;-o-tab-size:4;tab-size:4;"><code class="language-sh" data-lang="sh">$ git clone https://github.com/hexops/mach
$ cd mach/
$ zig build run-core-textured-cube
</code></pre>
                <small>Requires <a href="about/zig-version">this nominated Zig version</a> | <a href="/about/known-issues">known issues</a></small>
    </small>
            </div>
        </div>
    </div>
    <div class="p-section color-bg">
        <div style="text-align: left; max-width: 30rem;">
            <h2>Effortless cross-compilation</h2>
            <p>Cross-compile to any OS at the flip of a switch.</p>
<pre class="code" tabindex=0 style="color:#f8f8f2;background-color:#272822;-moz-tab-size:4;-o-tab-size:4;tab-size:4;"><code class="language-sh" data-lang="sh">$ zig build -Dtarget=x86_64-windows
$ zig build -Dtarget=x86_64-linux-gnu
$ zig build -Dtarget=x86_64-macos
$ zig build -Dtarget=aarch64-macos
</code></pre>
        </div>
        <a href="https://media.machengine.org/core/example/steamdeck.mp4" class="p-section-right">
            <video height="300px" autoplay loop muted>
            <source src="https://media.machengine.org/core/example/steamdeck.mp4" type="video/webm">
            </video>
        </a>
        <!-- <img class="p-img-left auto-color" src="/img/cpu.svg"></img> -->
    </div>
</div>


<div class="color-fg" style="clip-path: inset(0 0 -1rem 0)">
    <div class="p-section glass bright" style="min-height: 6rem; box-shadow: 0 0 3rem black; padding-bottom: 1rem; padding-top: 1rem; margin-top: 0;">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/img/core-dark.svg">
            <img alt="mach-glfw" src="/img/core-light.svg" style="float: left; height: 5rem; margin-right: 1rem; margin-top: -1rem; margin-bottom: -1rem;" class="p-img-left">
        </picture>
        <h1 style="margin-top: 0; text-align: left;">Comprehensive, but modular</h1>
    </div>
    <div class="p-section color-bg">
        <div style="text-align: left;">
            <h2>Competitive with other engines</h2>
            <p>Our ultimate aim is for Mach to have enough deeply-integrated components that it is a full, modern engine - with a GUI editor, UI library, rendering engine, physics & more.</p>
        </div>
        <img class="p-img-left auto-color" src="/img/thought_bubble.svg"></img>
    </div>
    <div class="p-section color-bg">
        <img class="p-img-right auto-color" src="/img/puzzle_heart.svg" style="height: 10rem; margin-right: 2rem;"></img>
        <div style="text-align: left;">
            <h2>Comprehensive, but modular</h2>
            <p>Engines of today are monolithic, you must embrace everything their way and getting just a subset is difficult or impossible. Many indie gamedevs choose libraries or frameworks as a result, but often spend time gluing libraries together.</p>
            <p>Mach aims to be a bunch of modules, carefully designed to work together nicely and without writing a bunch of glue code, building up to a unified (complete engine) experience. Use the parts you want.</p>
        </div>
    </div>
</div>

<div class="community">
    <div class="p-section" style="margin-top: 1rem;">
        <img class="p-img-right" style="height: 20rem; margin-right: 2rem;" src="/img/wrench_rocket.svg">
        <div class="card" style="max-width: 30rem; display: block;">
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
