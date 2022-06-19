---
title: "mach/gpu: the gpu.Interface for Zig"
description: "mach/gpu provides native, low-level graphics for Zig via WebGPU (DirectX 12, Metal, and Vulkan.) Get started in under 60s with these examples."
draft: false
layout: "unlimited"
rss_ignore: true
images: ["/img/mach-opengraph.png"]
---

<style>
.p-warning {
    text-align: center;
    padding: 0;
    padding-top: 0.5rem;
    padding-bottom: 0.5rem;
    background: red;
    margin-left: -1rem;
    margin-right: -1rem;
}
@media (prefers-color-scheme: light) {
    .p-warning, .p-warning a {
        color: white;
    }
}
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
.p-logo { margin-right: 3rem; margin-top: 2rem; }
.p-logo>img {
    height: 10rem;
    width: 100%;
}

h2 {
    text-align: left;
    margin-top: 0;
}

.code-inline {
    display: inline-block;
    padding-top: 0.25rem;
    padding-bottom: 0.25rem;
}
.code-inline>a {
    color: black;
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

@media (max-width:700px) {
    .p-warning { margin-top: 0; }
    .p-logo { margin: auto; margin-top: 0; margin-bottom: -2rem; }
    .p-logo img { margin-top: -1rem; }
    .p-section { margin-top: 4rem; flex-direction: column; }
    .p-section h2 { text-align: center; }
    .p-section-right { margin-left: 0; }
    .p-section-left { margin-right: 0; }
    .p-section small { margin: 0; display: block; text-align: center; }
    .p-img-left { margin: auto; margin-top: 2rem; margin-bottom: -1rem; height: 6rem; }
    .p-img-right { margin: auto; margin-bottom: 2rem; margin-top: -1rem; height: 6rem; }
    .p-section iframe {
        width: 100%;
        height: 15rem;
    }
}

.animated-demo > video, .static-demo > img {
    width: 30rem;
}
</style>

<div class="p-warning">
    Mach is still early stages - see <a href="/#early-stages">what we have today</a> and <em><a href="https://twitter.com/machengine">stay tuned.</a></em>
</div>

<h1 align="center">mach/gpu: the GPU interface for Zig</h1>
<div class="p-section">
    <img style="height: 15rem;" class="auto-color" src="https://user-images.githubusercontent.com/3173176/163735828-eb10335d-c984-4f7b-90cc-1e0a0edec1d0.png"></img>
    <div class="p-section-right">
        <img class="auto-color" style="width: 30rem;" src="https://user-images.githubusercontent.com/3173176/160261203-505aa417-e990-45bb-8a3d-17e224f1506c.png" />
        <p>Mach provides an ecosystem of WebGPU libraries and tools (leveraging Google Chrome's WebGPU implementation behind the scenes.) <a href="https://devlog.hexops.com/2022/mach-v0.1-zig-graphics-in-60s#behind-the-scenes">We do some heavy lifting</a> to give you effortless cross-compilation and make it all 'just work' with no hassle in under 60 seconds.</p>
        <p>WebGPU is low-level-in the future, we'll provide model rendering, text rendering, etc. as optional libraries on top: you get to pick choose what you use! You can use it merely to open a WebGPU window on every platform (with mobile and web in the future!)</p>
        <p>Every example below shows how to use WebGPU from Zig: they're not specific to Mach engine, but do use it for setup code.</p>
    </div>
</div>

<div class="p-section">
    <a class="animated-demo" href="https://user-images.githubusercontent.com/3173176/163732353-14657abc-d8d6-4367-847f-2b06821a1727.mp4">
        <video autoplay loop>
        <source src="https://user-images.githubusercontent.com/3173176/163732353-14657abc-d8d6-4367-847f-2b06821a1727.mp4" type="video/mp4">
        </video>
    </a>
    <div class="p-section-right">
        <h2><a href="https://github.com/hexops/mach/tree/main/examples/boids">boids example</a></h2>
        <p>Uses a GPU compute shader to run calculations / simulate flocking behaviour of birds.</p>
        <div>
<code><pre class="code">
git clone https://github.com/hexops/mach
cd mach/
zig build run-example-boids
</pre></code>
        </div>
        <small>~330 lines of code</small>
    </div>
</div>

<div class="p-section">
    <div class="p-section-left">
        <h2><a href="https://github.com/hexops/mach/tree/main/examples/triangle">triangle example</a></h2>
        <p>Tells the GPU to render 3 vertices (but doesn't transfer them using a vertex buffer or anything, the vertex positions are hard-coded in the shader.)</p>
        <div>
<code><pre class="code">
git clone https://github.com/hexops/mach
cd mach/
zig build run-example-triangle
</pre></code>
        </div>
        <small>~130 lines of code</small>
    </div>
    <a class="static-demo" href="https://user-images.githubusercontent.com/3173176/163738403-7f3f44aa-0982-49df-9c03-e78638194b86.png">
        <img src="https://user-images.githubusercontent.com/3173176/163738403-7f3f44aa-0982-49df-9c03-e78638194b86.png" />
    </a>
</div>

<div class="p-section">
    <a class="animated-demo" href="https://user-images.githubusercontent.com/3173176/163732380-77f0485d-35e2-4ae9-bc90-46962a33e369.mp4">
        <video autoplay loop>
        <source src="https://user-images.githubusercontent.com/3173176/163732380-77f0485d-35e2-4ae9-bc90-46962a33e369.mp4" type="video/mp4">
        </video>
    </a>
    <div class="p-section-right">
        <h2><a href="https://github.com/hexops/mach/tree/main/examples/rotating-cube">rotating-cube example</a></h2>
        <p>Uploads a basic 3D cube to the GPU and renders it. Demonstrates how to use vertex buffers to transfer a model from the CPU to GPU, how to use vertex attributes & more.</p>
        <div>
<code><pre class="code">
git clone https://github.com/hexops/mach
cd mach/
zig build run-example-rotating-cube
</pre></code>
        </div>
        <small>~290 lines of code</small>
    </div>
</div>

<div class="p-section">
    <div class="p-section-left">
        <h2><a href="https://github.com/hexops/mach/tree/main/examples/two-cubes">two-cubes example</a></h2>
        <p>Once you learn how to render one cube, two isn't much more code.</p>
        <div>
<code><pre class="code">
git clone https://github.com/hexops/mach
cd mach/
zig build run-example-two-cubes
</pre></code>
        </div>
        <small>~320 lines of code</small>
    </div>
    <a class="animated-demo" href="https://user-images.githubusercontent.com/3173176/163733010-df1cca4f-bd3f-403b-b785-5bc58fa04e10.mp4">
        <video autoplay loop>
        <source src="https://user-images.githubusercontent.com/3173176/163733010-df1cca4f-bd3f-403b-b785-5bc58fa04e10.mp4" type="video/mp4">
        </video>
    </a>
</div>

<div class="p-section">
    <a class="animated-demo" href="https://user-images.githubusercontent.com/3173176/164985623-93e01957-a86b-4607-827d-2a6cda32a409.mp4">
        <video autoplay loop>
        <source src="https://user-images.githubusercontent.com/3173176/164985623-93e01957-a86b-4607-827d-2a6cda32a409.mp4" type="video/mp4">
        </video>
    </a>
    <div class="p-section-right">
        <h2><a href="https://github.com/hexops/mach/tree/main/examples/textured-cube">textured-cube example</a></h2>
        <p>Loads a PNG image and uploads the texture to the GPU. Renders it on a 3D cube.</p>
        <div>
<code><pre class="code">
git clone https://github.com/hexops/mach
cd mach/
zig build run-example-textured-cube
</pre></code>
        </div>
        <small>~300 lines of code</small>
    </div>
</div>

<div class="p-section">
    <div class="p-section-left">
        <h2><a href="https://github.com/hexops/mach/tree/main/examples/instanced-cube">instanced-cube example</a></h2>
        <p>Instancing lets you duplicate an object & render it in multiple places with different parameters.</p>
        <div>
<code><pre class="code">
git clone https://github.com/hexops/mach
cd mach/
zig build run-example-instanced-cube
</pre></code>
        </div>
        <small>~240 lines of code</small>
    </div>
    <a class="animated-demo" href="https://user-images.githubusercontent.com/3173176/164985617-43c42aed-4f04-44a1-80c8-018cd124cbeb.mp4">
        <video autoplay loop>
        <source src="https://user-images.githubusercontent.com/3173176/164985617-43c42aed-4f04-44a1-80c8-018cd124cbeb.mp4" type="video/mp4">
        </video>
    </a>
</div>

<div class="p-section">
    <a class="animated-demo" href="https://user-images.githubusercontent.com/3173176/164985604-8f86fac1-68aa-4f64-a33f-1f7f45219d31.mp4">
        <video autoplay loop>
        <source src="https://user-images.githubusercontent.com/3173176/164985604-8f86fac1-68aa-4f64-a33f-1f7f45219d31.mp4" type="video/mp4">
        </video>
    </a>
    <div class="p-section-right">
        <h2><a href="https://github.com/hexops/mach/tree/main/examples/advanced-gen-texture-light">advanced-gen-texture-light example</a></h2>
        <p>Generates a brick texture at comptime, uses Blinn-Phong lighting, and several pipelines. Move camera with arrow keys / WASD.</p>
        <div>
<code><pre class="code">
git clone https://github.com/hexops/mach
cd mach/
zig build run-example-advanced-gen-texture-light
</pre></code>
        </div>
        <small>~760 lines of code</small>
    </div>
</div>

<div class="p-section">
    <img class="p-img-left auto-color" src="/img/people.svg"></img>
    <div class="p-section-right">
        <h2>Help contribute!</h2>
        <p>Eager to get started learning WebGPU in Zig? We'd love contributions for more examples!</p>
        <p>There's lots of great learning material online, we're <a href="https://matrix.to/#/#hexops:matrix.org">happy to help if you get stuck</a>, and there is a <a href="https://github.com/hexops/mach/issues/230">list of samples that are just waiting</a> to be ported to the Zig API.</p>
        <p>Special thanks to these people who've contributed to these examples:</p>
        <div style="max-width: 40rem; text-align: left; margin-top: 1rem;">
            <a href="https://github.com/Andoryuuta"><img src="https://images.weserv.nl/?url=github.com/Andoryuuta.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a>
            <a href="https://github.com/PiergiorgioZagaria"><img src="https://images.weserv.nl/?url=github.com/PiergiorgioZagaria.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a>
            <a href="https://github.com/d3m1gd"><img src="https://images.weserv.nl/?url=github.com/d3m1gd.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a>
            <a href="https://github.com/johanfforsberg"><img src="https://images.weserv.nl/?url=github.com/johanfforsberg.png?v=4&h=60&w=60&fit=cover&mask=circle&maxage=7d" width="60px" alt="" /></a>
        </div>
    </div>
</div>
