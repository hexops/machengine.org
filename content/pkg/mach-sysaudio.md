---
title: "mach sysaudio"
description: "Truly cross-platform, low-level, audio IO in Zig - input and output with minimal latency and a friendly API."
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div class="centered">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/sysaudio-full-dark.svg">
        <img alt="mach-sysaudio" src="/assets/mach/sysaudio-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <span>
        <a href="https://github.com/hexops/mach-sysaudio">GitHub repository</a> | <a href="https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Asysaudio">Issue tracker</a>
    </span>
</div>

Truly cross-platform, low-level, audio IO in Zig - playback and recording with backends for:

* Linux
  * PulseAudio
  * PipeWire
  * Jack
  * ALSA
* Windows: WASAPI
* macOS/iOS: CoreAudio
* WebAssembly: WebAudio

## Getting started

First [add the Mach standard library](/engine/stdlib) to your project so you can `@import("mach").sysaudio`.

Then check out [some example code](https://github.com/hexops/mach-sysaudio/tree/main/examples) for usage.

### Ran into trouble?

Feel free to join the [Mach Discord community](../../discord) for help.
