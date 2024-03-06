---
title: "mach ecs"
description: "Mach's Entity Component System, written from first-principles and designed for deep tooling capabilities."
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
---

<div class="centered">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="/assets/mach/ecs-full-dark.svg">
        <img alt="mach-ecs" src="/assets/mach/ecs-full-light.svg" style="height: 7rem; margin-top: 1rem;">
    </picture>
    <span>
        <a href="https://github.com/hexops/mach-ecs">GitHub repository</a> | <a href="https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Aecs">Issue tracker</a>
    </span>
</div>

The Mach entity component system, written from first-principles and designed for deep tooling capabilities.

* Initially a 100% clean-room implementation, working from first-principles; later informed by research into how other open-source ECS work.
* Enable deep tooling to provide tracing, editors, visualizers, profilers, etc.
* Fast, optimal for CPU caches, multi-threaded, leverage comptime for type safety.
* Dynamic, allow for very flexible runtime capabilities.

We're publishing a blog series ["Let's build an Entity Component System from scatch"](https://devlog.hexops.com/categories/build-an-ecs/) as we go.

## Experimental

This is an **experimental** project according to [our stability guarantees](../../about/stability):

> When a project has an experimental warning, it means all bets are off. You should carefully read the warning to understand why the project is experimental, and assume the worst.

**Tracking issue:** https://github.com/hexops/mach/issues/968
