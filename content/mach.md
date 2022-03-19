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
    margin-top: 3rem;
    align-items: center;
    justify-content: center;
    background: red;
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
.p-logo { margin: auto; }
.p-logo>img {
    height: 15rem;
    width: 100%;
    margin-top: 2rem;
}
.p-roadmap {
    margin-top: 2rem;
    margin-left: auto;
    margin-right: auto;
    width: 80%;
}
.p-roadmap>object {
    margin-top: 1rem;
    width: 100%;
}
.p-roadmap>p, .p-roadmap>h2 {
    text-align: center;
}
.p-contributors>img {
    margin-top: 1rem;
    display: inline-block;
    max-width: 130%;
    margin-left: -26.5%;
}


h2 {
    text-align: left;
    margin-top: 0;
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

<div class="p-logo"><img class="color-inverted" src="https://raw.githubusercontent.com/hexops/media/main/mach/logo_tagline.svg"></img></div>

<div class="p-warning">
    <div>
        <h2>We've only just begun</h2>
        <p>Mach engine is only 6 months old, it is still in <em>very early stages of development.</em></p>
        <p>While it is improving rapidly, we encourage being skeptical until we deliver on our promise. <a href="https://twitter.com/machengine">Stay tuned.</a></p>
    </div>
</div>

<div class="p-section">
    <div>
        <h2>Low level, but like never before</h2>
        <p>Mach engine is written in the <a href="https://ziglang.org">Zig programming language</a>, a successor to C with blazing fast performance, safety, compile-time code execution and more.</p>
        <p>Fast iteration & compile times, effortless cross-compilation, and zero reliance on system dependencies come out of the box with Mach. Just push button to start.</p>
    </div>
    <img class="p-img-left color-inverted" src="/img/cpu.svg"></img>
</div>

<div class="p-section">
    <img class="p-img-right color-inverted" src="/img/people.svg"></img>
    <div>
        <h2>Code and tools for everyone</h2>
        <p>We're not just building a new engine, we're building a suite of tools and libraries for all to use-with Mach, other engines, and even not for game developers at all-we want the tools and libraries we build to <em>benefit you</em>.</p>
        <p>One example of this is how <a href="https://github.com/hexops/mach/issues/109">we're making</a> Dawn (Google Chrome's WebGPU implementation) easier to build and cross compile with nothing more than <code>zig</code> and <code>git</code>, which other projects outside the Zig ecosystem can benefit from in the future.</p>
    </div>
</div>

<div class="p-roadmap">
    <h2>Reaching Mach 1</h2>
    <object class="color-inverted" type="image/svg+xml" data="/img/mach1.svg?v2"></object>
    <p><a href="/img/mach1.svg?v2">(view as SVG)</a></p>
    <p>Timeline for completion is not yet well-defined. Plans will change over time.</p>
    <p>We encourage being skeptical of any promise we make until we actually deliver on it!</p>
</div>

<div class="p-section">
    <img class="p-img-right color-inverted" src="/img/opensource.svg"></img>
    <div>
        <h2>Open source, sustainable</h2>
        <p><a href="https://github.com/hexops/mach">100% open source</a>, licensed under Apache or MIT at your choosing. We are firm believers in open source, have played open source games and worked with open source game engines <a href="https://devlog.hexops.com/2021/increasing-my-contribution-to-zig-to-200-a-month#i-grew-up-playing-linux-games-like-mania-drive">for over 13 years.</a> We operate on a mix of <a href="https://github.com/sponsors/slimsag">donations</a> and self-funding. Hexops in the future will also sell games to sustain development-not engines or tools.</p>
    </div>
</div>

<div class="p-section sponsors">
    <div>
        <h2>Sponsors</h2>
        <p>The following people <a href="github.com/sponsors/slimsag">sponsor @slimsag</a> on GitHub for his work on Mach engine, <a href="https://zigmonthly.org">zigmonthly.org</a>, and/or other projects:</p>
        <div style="max-width: 40rem; text-align: left; margin-top: 1rem;">
            <!-- tier2 --><a href="https://github.com/wilsonk"><img src="https://images.weserv.nl/?url=github.com/wilsonk.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/ziglang"><img src="https://images.weserv.nl/?url=github.com/ziglang.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><!-- tier2 --><!-- tier1 --><a href="https://github.com/mattnite"><img src="https://images.weserv.nl/?url=github.com/mattnite.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/andrewrk"><img src="https://images.weserv.nl/?url=github.com/andrewrk.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/Luukdegram"><img src="https://images.weserv.nl/?url=github.com/Luukdegram.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/Jack-Ji"><img src="https://images.weserv.nl/?url=github.com/Jack-Ji.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/ZacxDev"><img src="https://images.weserv.nl/?url=github.com/ZacxDev.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/kristoff-it"><img src="https://images.weserv.nl/?url=github.com/kristoff-it.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/tauoverpi"><img src="https://images.weserv.nl/?url=github.com/tauoverpi.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/TommiSinivuo"><img src="https://images.weserv.nl/?url=github.com/TommiSinivuo.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/bradms"><img src="https://images.weserv.nl/?url=github.com/bradms.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jayschwa"><img src="https://images.weserv.nl/?url=github.com/jayschwa.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jamii"><img src="https://images.weserv.nl/?url=github.com/jamii.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/dawnarc"><img src="https://images.weserv.nl/?url=github.com/dawnarc.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jacobsandlund"><img src="https://images.weserv.nl/?url=github.com/jacobsandlund.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><a href="https://github.com/jorangreef"><img src="https://images.weserv.nl/?url=github.com/jorangreef.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a><!-- tier1 -->
        </div>
    </div>
    <img class="p-img-right color-inverted" src="/img/sponsor.svg"></img>
</div>

<div class="p-section">
    <img class="p-img-right color-inverted" src="/img/coder.svg"></img>
    <div>
        <h2>Contributors</h2>
        <p>Mach engine is primarily being developed by <a href="https://twitter.com/slimsag">@slimsag</a>, however the following people have made contributions on GitHub both small and large to Mach itself as well as the libraries we maintain for use in Mach and other projects alike:</p>
        <a class="p-contributors" href="https://github.com/hexops/mach/graphs/contributors">
            <img src="https://contrib.rocks/image?repo=hexops/mach" />
        </a>
    </div>
</div>

<!--
<div class="p-section">
    <div style="padding-right: 3rem; text-align: right">
        <h2>What's next for Mach in 2022?</h2>
        <small style="display: inline-block; width: 20rem; padding-top: 1rem">
            (Lightning talk presented at the first ever European Zig meetup in Milan, Italy.)
        </small>
    </div>
    <iframe width="560" height="315" src="https://www.youtube.com/embed/m3gOX26LOeM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
-->

<div class="p-section">
    <div style="width: 30rem;">
        <h2>Follow along</h2>
        <p>Find all of the latest news & updates about Mach engine on <a href="https://devlog.hexops.com/categories/mach/">devlog.hexops.com</a> and <a href="https://twitter.com/machengine">follow on Twitter</a>.
    </div>
    <div style="width: 30rem;">
        <h2>Get involved</h2>
        <p>If this all sounds appealing to you, you can get involved <a href="https://github.com/hexops/mach">over on GitHub</a> and <a href="https://matrix.to/#/#hexops:matrix.org">join us on Matrix chat</a>!</p>
    </div>
</div>
