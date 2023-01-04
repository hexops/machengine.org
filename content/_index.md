---
title: "Mach"
description: "Game engine & graphics toolkit for the future"
draft: false
layout: "unlimited"
rss_ignore: true
images: ["/img/mach-opengraph.png"]
---

<style>
.p-section {
    display: flex;
    flex-direction: row;
    margin-top: 3rem;
    align-items: center;
    justify-content: center;
}
.p-section-highlight {
    margin-top: 4rem;
    margin-bottom: 2rem;
}
.p-section-right {
    margin-left: 1rem;
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
.contributors h2,
.sponsors h2 {
    text-shadow: 2px 2px black;
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

#hero-background {
    display: block;
    background-image: url(img/castle_poly.webp);
}

.choose-your-journey {
    display: flex;
    flex-direction: column;
    height: calc(100vh - 3rem);
    min-height: 47.5rem;
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
.choose-your-journey .content>video {
    width: 30rem;
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
    text-shadow: 2px 2px 6px black;
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
.pitch {
    padding-bottom: 2.5rem;
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

.p-section.final-choose-your-journey {
    padding-top: 20%;
    padding-bottom: 15%;
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
</style>

<div class="choose-your-journey">
    <div class="options">
        <div class="engine">
            <div class="content">
                <h1 style="font-size: 40px;">Mach engine <span style="font-size: 12px;">(coming soon)</span></h1>
                <h2>Competitive in spirit with other engines</h2>
                <video autoplay loop muted>
                    <source src="https://user-images.githubusercontent.com/3173176/210317135-9f3d068b-cdb8-40a1-b23d-cebaa0a962f3.webm" type="video/webm">
                </video>
            </div>
        </div>
        <div class="core">
            <div class="content">
                <h1 style="font-size: 40px;">Mach core</h1>
                <h2>Modern alternative to SDL/etc</h2>
                <video autoplay loop muted>
                    <source src="https://user-images.githubusercontent.com/3173176/210314999-b092b6f2-34ae-45aa-b6e9-c553a034835d.webm" type="video/webm">
                </video>
            </div>
        </div>
    </div>
    <div>
        <a href="/docs" class="big-button">
            <img src="/img/wrench.svg">
            Choose your journey
        </a>
    </div>
</div>

<div class="pitch color-bg color-fg">
    <div class="p-section">
        <div style="text-align: left;">
            <h1 style="margin-top: 0;">Built with love, hard-work & Zig</h1>
            <img style="float: left; height: 5rem; margin-right: 1rem; margin-top: 0.5rem;" src="https://raw.githubusercontent.com/ziglang/logo/6446ba8e37a0651da720d8869e1ce9264fa0c0b9/zig-mark.svg">
            <p><a href="https://ziglang.org">Zig</a> is a general-purpose simple programming language featuring compile-time code execution, blazing-fast compilation speeds, and bare-metal performance.</p>
        </div>
    </div>
    <div class="p-section p-section-highlight">
        <video autoplay loop muted playsinline style="width: 24rem;">
        <source src="https://user-images.githubusercontent.com/3173176/210317154-90e7a41c-2b44-4ee6-956f-5a93285e19ef.webm" type="video/webm">
        </video>
        <div class="p-section-right">
            <div style="text-align: left;">
                <h2>Try it out in just ~60 seconds</h2>
                <small style="margin-left: 1rem; display: inline-block; width: 35rem;">Only  zig, git, and curl required. No build tools, no system dependencies. (<a href="/doc/about#zero-fuss-installation">how?</a>)</small>
            </div>
            <div>
<code><pre class="code">
git clone --recursive https://github.com/hexops/mach-examples
cd mach-examples/
zig build run-textured-cube
</pre></code>
                <small>Requires <a href="https://ziglang.org">zig 0.11.x</a> | 
    <a href="/docs/known-issues">known issues</a>
    </small>
            </div>
        </div>
    </div>
    <div class="p-section">
        <div style="text-align: left;">
            <h2>Effortless cross-compilation</h2>
            <p>Cross-compile to Windows, macOS, Linux & Steam Deck at the flip of a switch. WebAssembly, Android & iOS coming soon.</p>
<code><pre class="code">
<strong>$</strong> zig build -Dtarget=x86_64-windows
<strong>$</strong> zig build -Dtarget=x86_64-linux
<strong>$</strong> zig build -Dtarget=x86_64-macos
<strong>$</strong> zig build -Dtarget=aarch64-macos
</pre></code>
        </div>
        <img class="p-img-left auto-color" src="/img/cpu.svg"></img>
    </div>
    <div class="p-section">
        <img class="p-img-right auto-color" style="height: 12rem; margin-right: 1rem;" src="/img/penguin.svg"></img>
        <div style="text-align: left;">
            <h2>First-class Linux support</h2>
            <p>We aim to <em>truly</em> support Linux. Native Vulkan, and OpenGL/GLES fallbacks, plus support for both X11 and Wayland in the same binary via runtime detection.</p>
            <p>From mesa drivers-to your experimental compositor-and broken vsync implementation, we'll make it run as well as we can.</p>
        </div>
    </div>
    <div class="p-section" style="border-top: 1px solid #414153; border-top-width: 0.5rem; margin-top: 6rem;">
        <img style="height: 10rem; margin-right: 1rem; margin-top: 0.5rem;" src="/img/core.svg">
        <div style="text-align: left;">
            <h1 style="margin-top: 0;">Mach core & standalone libraries</h1>
            <p>Mach engine is built atop a solid foundation called <em>Mach core</em> and a set of standalone libraries, which together help build the Zig gamedev ecosystem.</p>
        </div>
    </div>
    <div class="p-section">
        <div style="text-align: left;">
            <h2>A modern alternative to SDL/etc</h2>
            <p><em>Mach core</em> gets you a Window+Input+GPU, nothing else.</p>
            <p>Includes zero-fuss installation, cross-compilation at the flip of a switch, and the power of Vulkan/DirectX/Metal/OpenGL in a concise, modern graphics API (including compute) natively using Google's WebGPU implementation.</p>
            <p>Use it from Zig or via our C ABI, and soon you'll be able to compile to WebAssembly and Mobile targets using the same API.</p>
        </div>
        <img class="p-img-left auto-color-inverted" style="height: 12rem;" src="/img/mach_core_icon.svg"></img>
    </div>
    <div class="p-section">
        <div style="text-align: center;">
            <h2 style="margin-top: 0; text-align: center;">Standalone libraries</h2>
            <p>Mach provides 11+ high-quality standalone Zig libraries, helping to build out the Zig gamedev ecosystem.</p>
            <br/>
            <a href="https://github.com/hexops/mach-gpu" class="img-link">
                <picture>
                    <source media="(prefers-color-scheme: dark)" srcset="/assets/media/gpu/logo_standalone_dark.svg">
                    <img alt="mach/gpu" src="/assets/media/gpu/logo_standalone_light.svg" style="height: 5rem; margin-right: 1rem; margin-top: 0.5rem;">
                </picture>
            </a>
            <a href="https://github.com/hexops/mach/tree/main/libs/ecs" class="img-link">
                <picture>
                    <source media="(prefers-color-scheme: dark)" srcset="/assets/media/ecs/logo_standalone_dark.svg">
                    <img alt="mach/ecs" src="/assets/media/ecs/logo_standalone_light.svg" style="height: 5rem; margin-right: 1rem; margin-top: 0.5rem;">
                </picture>
            </a>
            <a href="https://github.com/hexops/mach/tree/main/libs/sysaudio" class="img-link">
                <picture>
                    <source media="(prefers-color-scheme: dark)" srcset="/assets/media/sysaudio/logo_standalone_dark.svg">
                    <img alt="mach/sysaudio" src="/assets/media/sysaudio/logo_standalone_light.svg" style="height: 5rem; margin-right: 1rem; margin-top: 0.5rem;">
                </picture>
            </a>
            <a href="https://github.com/hexops/mach/tree/main/libs/sysjs" class="img-link">
                <picture>
                    <source media="(prefers-color-scheme: dark)" srcset="/assets/media/sysjs/logo_standalone_dark.svg">
                    <img alt="mach/gpu" src="/assets/media/sysjs/logo_standalone_light.svg" style="height: 5rem; margin-right: 1rem; margin-top: 0.5rem;">
                </picture>
            </a>
        </div>
    </div>
    <div class="p-section" style="border-top: 1px solid #414153; border-top-width: 0.5rem; margin-top: 6rem;">
        <picture>
            <source media="(prefers-color-scheme: dark)" srcset="/assets/media/mach/icon_dark.svg">
            <img alt="Mach" style="height: 10rem; margin-right: 1rem; padding-top: 3rem; margin-top: -2.5rem;" src="/assets/media/mach/icon_light.svg">
        </picture>
        <div style="text-align: left;">
            <h1 style="margin-top: 0;">Mach engine (coming soon)</h1>
            <p>Our higher-level libraries for <em>Mach engine</em> are not ready for use yet, and work on the GUI editor has not yet begun. This section is to give a taste of what we're building towards.</p>
        </div>
    </div>
    <div class="p-section">
        <div style="text-align: left;">
            <h2>Modular</h2>
            <p>Mach engine is designed to be <em>modular</em>, the only part you must adopt is our Entity Component System (as all modules are built using this to integrate with one another.)</p>
            <p>All modules will be <em>optional</em>, so that you can easily plug-and-play different ones for making GUIs, rendering 2D sprites, 3D meshes, physics & more.</p>
        </div>
        <img class="p-img-left auto-color" src="/img/puzzle_heart.svg"></img>
    </div>
    <div class="p-section" style="margin-bottom: 3rem;">
        <img class="p-img-right auto-color" src="/img/thought_bubble.svg" style="height: 12rem; margin-right: 1rem;"></img>
        <div style="text-align: left;">
            <h2>Competitive in spirit with other engines</h2>
            <p>We're planning a fully-fledged set of deeply integrated tools, a proper editor, the whole deal-we're not kidding around here.</p>
            <p>But we're also realistic, and only want to speak once we really have something to show that you'll love - so please wait to hear our voice.</p>
        </div>
    </div>
</div>

<div class="community">
    <div class="p-section" style="margin-top: 1rem;">
        <img class="p-img-right" style="height: 20rem; margin-right: 2rem;" src="/img/wrench_rocket.svg">
        <div class="transparent-card" style="width: 30rem; display: block;">
            <h1 style="margin-top: 0;">Community</h1>
            <small>Small but growing, you'll find most of us on Discord and GitHub.</small>
            <br>
            <a href="https://discord.gg/XNG3NZgCqp" class="p-community-icon glass-link">
                <img alt="Discord" class="p-community-icon" src="/img/discord.svg">
            </a>
            <a href="https://github.com/hexops/mach" class="p-community-icon glass-link">
                <img alt="GitHub" class="p-community-icon" src="/img/github.svg">
            </a>
            <a href="https://reddit.com/r/machengine" class="p-community-icon glass-link">
                <img alt="Reddit" class="p-community-icon" src="/img/reddit.svg">
            </a>
            <br>
            <small>There's plenty to do, so if you're eager to get involved please join the community, say hi, check out the code and see if you can contribute!</small>
        </div>
    </div>
    <div class="p-section always-open-source">
        <div class="transparent-card">
            <a href="https://github.com/slimsag">
                <img class="p-img-left p-img-small" src="https://avatars.githubusercontent.com/u/3173176?v=4">
            </a>
            <div style="text-align: left;">
                <h2>Open source, always & forever</h2>
                <small style="margin-left: 1rem;">Apache or MIT licensed, at your choosing.</small>
                <p>Stephen here! There are few things in life I am more passionate about than Mach. I've been dreaming of it for over a decade: a modern, modular game engine in a simple & powerful language like Zig, exploring how much more simple and intuitive gamedev tooling could be.</p>
                <p><a href="https://devlog.hexops.com/2021/increasing-my-contribution-to-zig-to-200-a-month#i-grew-up-playing-linux-games-like-mania-drive">FOSS is in my roots</a>: we should own our tools, they should empower <em>us</em>, not be part of <a href="https://kristoff.it/blog/the-open-source-game/">the open source game</a> where investors behind the scenes expect multi-million dollar returns in a few years time by sideloading a business off the community. I've had VCs urge me to take investment and start businesses around my open source work before, and I could get investment for Mach if I wanted.</p>
                <p>But Mach needs to be for people like you and me: it needs to be <a href="https://kristoff.it/blog/software-you-can-love/">Software You Can Love</a> - and the big tech model is not compatible with that as we see with other engines today. Instead, I am working <a href="https://devlog.hexops.com/2021/i-write-code-100-hours-a-week/">double time</a> towards my dreams: a simple, modest, future where I can earn a living building Mach for you, and creating high-quality games for all.</p>
                <p>If you can contribute time or <a href="https://github.com/sponsors/slimsag">donate</a> to help me reach my goals, I will be eternally grateful and will make you proud one day in the future.</p>
            </div>
        </div>
    </div>
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
            <h2>Supporters</h2>
            <div style="max-width: 50rem; text-align: left; margin-top: 1rem;">
                <!-- tier2 --><a href="https://github.com/tauoverpi"><img src="https://images.weserv.nl/?url=github.com/tauoverpi.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jamii"><img src="https://images.weserv.nl/?url=github.com/jamii.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/ziglang"><img src="https://images.weserv.nl/?url=github.com/ziglang.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/shintales"><img src="https://images.weserv.nl/?url=github.com/shintales.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/m3talsmith"><img src="https://images.weserv.nl/?url=github.com/m3talsmith.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/mitchellh"><img src="https://images.weserv.nl/?url=github.com/mitchellh.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/dzrw"><img src="https://images.weserv.nl/?url=github.com/dzrw.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/davidroman0O"><img src="https://images.weserv.nl/?url=github.com/davidroman0O.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/batiati"><img src="https://images.weserv.nl/?url=github.com/batiati.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/arsdragonfly"><img src="https://images.weserv.nl/?url=github.com/arsdragonfly.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><!-- tier2 --><!-- tier1 --><a href="https://github.com/mattnite"><img src="https://images.weserv.nl/?url=github.com/mattnite.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/andrewrk"><img src="https://images.weserv.nl/?url=github.com/andrewrk.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/kristoff-it"><img src="https://images.weserv.nl/?url=github.com/kristoff-it.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/TommiSinivuo"><img src="https://images.weserv.nl/?url=github.com/TommiSinivuo.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jayschwa"><img src="https://images.weserv.nl/?url=github.com/jayschwa.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jacobsandlund"><img src="https://images.weserv.nl/?url=github.com/jacobsandlund.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jorangreef"><img src="https://images.weserv.nl/?url=github.com/jorangreef.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/karelp"><img src="https://images.weserv.nl/?url=github.com/karelp.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/ifreund"><img src="https://images.weserv.nl/?url=github.com/ifreund.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/shritesh"><img src="https://images.weserv.nl/?url=github.com/shritesh.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/nickcernis"><img src="https://images.weserv.nl/?url=github.com/nickcernis.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/user01"><img src="https://images.weserv.nl/?url=github.com/user01.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/silversquirl"><img src="https://images.weserv.nl/?url=github.com/silversquirl.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/sdnts"><img src="https://images.weserv.nl/?url=github.com/sdnts.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/teknico"><img src="https://images.weserv.nl/?url=github.com/teknico.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/LostKobrakai"><img src="https://images.weserv.nl/?url=github.com/LostKobrakai.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jagt"><img src="https://images.weserv.nl/?url=github.com/jagt.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/ChrisGute"><img src="https://images.weserv.nl/?url=github.com/ChrisGute.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/dylanmcdiarmid"><img src="https://images.weserv.nl/?url=github.com/dylanmcdiarmid.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/MEATANDMEAT"><img src="https://images.weserv.nl/?url=github.com/MEATANDMEAT.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/johnburton"><img src="https://images.weserv.nl/?url=github.com/johnburton.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/ryupold"><img src="https://images.weserv.nl/?url=github.com/ryupold.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/hryx"><img src="https://images.weserv.nl/?url=github.com/hryx.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/r4gus"><img src="https://images.weserv.nl/?url=github.com/r4gus.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/kooparse"><img src="https://images.weserv.nl/?url=github.com/kooparse.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/Manuzor"><img src="https://images.weserv.nl/?url=github.com/Manuzor.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/peartreegames"><img src="https://images.weserv.nl/?url=github.com/peartreegames.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/C-BJ"><img src="https://images.weserv.nl/?url=github.com/C-BJ.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/gegogi"><img src="https://images.weserv.nl/?url=github.com/gegogi.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><!-- tier1 -->
            </div>
        </div>
    </div>
    <div class="p-section final-choose-your-journey">
        <a href="/docs" class="big-button">
            <img src="/img/wrench.svg">
            Choose your journey
        </a>
    </div>
</div>