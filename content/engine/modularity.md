---
title: "Engine modularity"
description: "Opinionated enough to provide high-level experiences, modular enough to let anyone break out of the 'blessed' paths we have chosen."
draft: false
layout: "docs"
docs_type: "engine"
rss_ignore: true
---

# Modularity

Historically, we believe there are three types of approaches to game development:

| Description | Opinionated? | Modularity? | Note                                                                   |
| ----------- | ------------ | ----------- | ---------------------------------------------------------------------- |
| Libraries   | Not at all   | Extremely   | No natural interoperability, lots of glue code required                |
| Frameworks  | Somewhat     | Very        | Often unable to provide high-level experiences due to modularity       |
| Engines     | Extremely    | Not at all  | Provides high-level experiences but makes rigid choices on your behalf |

The Mach project provides some Libraries, but mostly aims to sit between Frameworks and Engines. Opinionated where it matters to provide high-level experiences like engines do, but modular enough to let anyone break out of the 'blessed' paths we have chosen to do their own thing.

## Where is 'Mach engine'?

'Mach engine' is the _combined overall experience_ of two things:

1. The [Mach standard library](../stdlib) - the engine APIs and 'blessed' paths for doing things, but still modular.
2. The [Mach editor and CLI tooling](https://github.com/hexops/mach-editor) - which provide standard tools and high-level experiences you'd expect from a game engine

Whether you use both, or how much of either you decide to use, is up to you!

## Can I make my own game engine using Mach?

Yes! For example instead of using GLFW/SDL+OpenGL+glm as the base for your own engine, you might choose to use `mach.core` and `mach.math` from our [standard library](../stdlib).
