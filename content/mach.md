---
title: "Mach engine"
description: "Game engine & graphics toolkit for the future"
layout: "mach"
draft: false
rss_ignore: true
images: ["/img/mach-opengraph.png"]
---

<style>
.p-warning {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    padding-top: 1rem;
    padding-bottom: 1rem;
    padding-left: 1rem;
    padding-right: 1rem;
    margin-left: -1rem;
    margin-right: -1rem;
}
.p-section {
    display: flex;
    flex-direction: row;
    margin-top: 3rem;
    align-items: center;
    justify-content: center;
}
.p-img-left {
    height: 10rem;
    margin-left: 4.5rem;
}
.p-img-right {
    height: 10rem;
    margin-right: 4.5rem;
}
.p-logo { margin-right: 3rem; margin-top: 2rem; }
.p-logo>img {
    height: 10rem;
    width: 100%;
}

h2 {
    text-align: left;
    margin-top: 0;
}

.code {
    text-align: left;
    background: #c2c2c2;
    color: black;
    padding: 0.5rem;
    font-weight: bold;
}

.code::-moz-selection { /* Code for Firefox */
  color: white;
  background: black;
}

.code::selection {
  color: white;
  background: black;
}

@media (max-width:480px) {
    .p-warning { margin-top: 0; }
    .p-logo { margin: auto; margin-top: 0; margin-bottom: -2rem; }
    .p-logo img { margin-top: -1rem; }
    .p-section { margin-top: 2rem; align-items: flex-start; }
    .p-img-left { margin-left: 1rem; height: 3rem; }
    .p-img-right { margin-right: 1rem; height: 3rem; }
    .p-section.sponsors img {
        width: 42px;
    }
}
</style>

<div style="text-align: center; padding: 0; padding-top: 0.5rem; padding-bottom: 0.5rem; background: red; margin-left: -1rem; margin-right: -1rem;">
    Mach is still early stages - see <a href="#early-stages">what we have today</a> and <em><a href="https://twitter.com/machengine">stay tuned.</a></em>
</div>

<div class="p-logo"><img class="color-inverted" src="https://raw.githubusercontent.com/hexops/media/main/mach/logo_tagline.svg"></img></div>

<div class="p-section" style="margin-top: 4rem; margin-bottom: 2rem;">
    <a href="https://user-images.githubusercontent.com/3173176/159139694-a8cba628-9c1e-4a4f-be7c-40084d4318e8.png"><img style="height: 15rem;" src="https://user-images.githubusercontent.com/3173176/159139851-013fc1ad-98d2-4fed-ae58-1d5eaa658a15.png"></img></a>
    <div style="margin-left: 1rem;">
        <h2>Cross-platform graphics in ~60s</h2>
        <div>
<code><pre class="code">
git clone https://github.com/hexops/mach
cd mach/gpu
zig build run-example
</pre></code>
            <small>Cross-platform graphics, a unified shader language & compute shaders.</small>
            <br/><small>Requires <a href="https://ziglang.org">zig 0.10.x</a></small>
        </div>
    </div>
</div>

<div class="p-section">
    <a href="https://user-images.githubusercontent.com/3173176/159140683-0714eb12-806a-43e5-980f-63aa0d998fc2.png"><img class="p-img-right" style="height: 15rem;" src="https://user-images.githubusercontent.com/3173176/159140683-0714eb12-806a-43e5-980f-63aa0d998fc2.png"></img></a>
    <div style="text-align: left;">
        <h2>All you need is zig, git, and curl.</h2>
        <small style="margin-left: 1rem;">No more installing tools & dependencies to get started</small>
        <p>Mach builds <em>everything</em> using the Zig C/C++ compiler: GLFW, Google Chrome's WebGPU implementation, even the DirectX Shader Compiler.</p>
        <p>Prebuilt binaries are used for WebGPU so you don't even have to wait for compilation - just add `-Ddawn-from-source=true` for a 100% from-source build.</p>
    </div>
</div>

<div class="p-section">
    <div style="text-align: left;">
        <h2>Built with love, hard work, and Zig</h2>
        <small style="margin-left: 1rem;">Effortless cross-compilation at your fingertips</small>
        <p>Mach is written in <a href="https://ziglang.org">Zig</a>, a successor to C with blazing fast performance, compile-time code execution, safety, and in the future <a href="http://www.jakubkonka.com/2022/03/16/hcs-zig.html">hot code swapping</a>.</p>
<code><pre class="code">
<strong>$</strong> zig build -Dtarget=<strong>x86_64-windows</strong>
<strong>$</strong> zig build -Dtarget=<strong>x86_64-linux</strong>
<strong>$</strong> zig build -Dtarget=<strong>x86_64-macos</strong>.12
<strong>$</strong> zig build -Dtarget=<strong>aarch64-macos</strong>.12
</pre></code>
    </div>
    <img class="p-img-left color-inverted" src="/img/cpu.svg"></img>
</div>


<div class="p-section" id="early-stages">
    <div style="text-align: right; padding-right: 2rem; border-right: 1px solid gray; height: 12rem; justify-content: center; display: flex; flex-direction: column;">
        <h2>⚠ Mach is early stages</h2>
        <p style="display: inline-block; text-align: right; margin-right: 0;">
            What we do have is nice ⮕
            <br/>and things are improving rapidly,
            <br/>but we're not at Mach 1.0 yet,
            <br/>we're missing lots - <em><a href="https://twitter.com/machengine">stay tuned.</a></em>
        </p>
    </div>
    <div style="text-align: left;">
        <ul>
            <li>Windows, Linux, and macOS support</li>
            <li>Graphics API</li>
            <ul>
                <li>Metal, Vulkan, DirectX 12 & OpenGL fallback (WebGPU)</li>
                <li>Unified shader language (WGSL)</li>
                <li>Compute shaders</li>
                <li>(lacking) Documentation & examples</li>
            </ul>
            <li>Input (GLFW)</li>
            <li>(experimental) Entity Component System</li>
        </ul>
    </div>
</div>

<!--
<div class="p-section" style="flex-direction: column;">
    <h2>What's next? (Lightning talk)</h2>
    <small style="display: inline-block; padding-top: 1rem">
        Broadcast at the first ever European Zig meetup in Milan, Italy.
    </small>
    <iframe width="560" height="315" src="https://www.youtube.com/embed/m3gOX26LOeM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
-->

<div class="p-section">
    <img class="p-img-right color-inverted" src="/img/opensource.svg"></img>
    <div style="text-align: left;">
        <h2>Building tools & libraries to benefit <em>all</em></h2>
        <small style="margin-left: 1rem;">Prefer Unity/Unreal? Not using Zig? We plan for our work to be useful for you too.</small>
        <p>Our <a href="https://github.com/hexops/mach-glfw">glfw</a> bindings <a href="https://devlog.hexops.com/2021/perfecting-glfw-for-zig-and-finding-undefined-behavior">found lurking undefined behavior</a> that went unnoticed for years. Use <a href="https://github.com/hexops/mach-gpu-dawn">mach/gpu-dawn</a> from your language of choice to build Google Chrome's WebGPU implementation via Zig (no cmake/ninja/gn/etc) into a single static library, with cross-compilation & prebuilt binaries.</p>
        <p>These are all small potatoes. In the future, tooling is where we'll really contribute.</p>
    </div>
</div>

<div class="p-section">
    <div style="text-align: left;">
        <h2>Open source, always & forever</h2>
        <small style="margin-left: 1rem;">Apache or MIT licensed, at your choosing.</small>
        <p>FOSS is our roots, we've been playing with and developing FOSS games & engines <a href="https://devlog.hexops.com/2021/increasing-my-contribution-to-zig-to-200-a-month#i-grew-up-playing-linux-games-like-mania-drive">for 13+ years.</a></p>
    </div>
    <img class="p-img-left color-inverted" src="/img/people.svg"></img>
</div>

<div class="p-section">
    <img class="p-img-right color-inverted" src="/img/coder.svg"></img>
    <div>
        <h2>Contributors</h2>
        <p>Mach is created primarily by BDFL <a href="https://twitter.com/slimsag">@slimsag</a>, but we're very open to contributors! And since our projects are useful outside of Mach itself, there are already a few:</p>
        <div style="max-width: 40rem; text-align: left; margin-top: 1rem;">
            <a href="https://github.com/InKryption"><img src="https://images.weserv.nl/?url=github.com/InKryption.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a>
            <a href="https://github.com/alichraghi"><img src="https://images.weserv.nl/?url=github.com/alichraghi.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a>
            <a href="https://github.com/leecannon"><img src="https://images.weserv.nl/?url=github.com/leecannon.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a>
            <a href="https://github.com/iddev5"><img src="https://images.weserv.nl/?url=github.com/iddev5.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a>
            <a href="https://github.com/Avokadoen"><img src="https://images.weserv.nl/?url=github.com/Avokadoen.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a>
        </div>
    </div>
</div>

<div class="p-section sponsors">
    <div>
        <h2>Sponsors</h2>
        <p><a href="github.com/sponsors/slimsag">Sponsor us on GitHub</a> to help Mach engine, <a href="https://zigmonthly.org">zigmonthly.org</a>, and our other work. All of these fine people contribute financially:</p>
        <div style="max-width: 40rem; text-align: left; margin-top: 1rem;">
            <!-- tier2 --><a href="https://github.com/wilsonk"><img src="https://images.weserv.nl/?url=github.com/wilsonk.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/ziglang"><img src="https://images.weserv.nl/?url=github.com/ziglang.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><!-- tier2 --><!-- tier1 --><a href="https://github.com/mattnite"><img src="https://images.weserv.nl/?url=github.com/mattnite.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/andrewrk"><img src="https://images.weserv.nl/?url=github.com/andrewrk.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/Luukdegram"><img src="https://images.weserv.nl/?url=github.com/Luukdegram.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/Jack-Ji"><img src="https://images.weserv.nl/?url=github.com/Jack-Ji.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/ZacxDev"><img src="https://images.weserv.nl/?url=github.com/ZacxDev.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/kristoff-it"><img src="https://images.weserv.nl/?url=github.com/kristoff-it.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/tauoverpi"><img src="https://images.weserv.nl/?url=github.com/tauoverpi.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/TommiSinivuo"><img src="https://images.weserv.nl/?url=github.com/TommiSinivuo.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/bradms"><img src="https://images.weserv.nl/?url=github.com/bradms.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jayschwa"><img src="https://images.weserv.nl/?url=github.com/jayschwa.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jamii"><img src="https://images.weserv.nl/?url=github.com/jamii.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/dawnarc"><img src="https://images.weserv.nl/?url=github.com/dawnarc.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jacobsandlund"><img src="https://images.weserv.nl/?url=github.com/jacobsandlund.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jorangreef"><img src="https://images.weserv.nl/?url=github.com/jorangreef.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><!-- tier1 -->
        </div>
    </div>
    <img class="p-img-right color-inverted" src="/img/sponsor.svg"></img>
</div>

<div class="p-section">
    <div style="width: 25rem;">
        <h2>Follow along</h2>
        <p>Major developments can be followed on our <a href="https://devlog.hexops.com/categories/mach/">devlog</a> and the <a href="https://twitter.com/machengine">@machengine</a> Twitter.
    </div>
    <div style="margin-left: 3rem">
        <h2>Get involved</h2>
        <p>Checkout <a href="https://github.com/hexops/mach">our GitHub</a> and <a href="https://matrix.to/#/#hexops:matrix.org">join us on Matrix chat</a>!</p>
    </div>
</div>
