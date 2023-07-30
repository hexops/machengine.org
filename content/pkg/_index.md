---
title: "Mach packages: 100% standalone Zig gamedev libraries"
description: "Mach provides an ecosystem of 100% standalone, high-quality Zig gamedev packages, and they all feature zero-fuss installation, broad platform support, and cross-compilation at the flip of a switch."
draft: false
layout: "docs"
docs_type: "pkg"
rss_ignore: true
images: ["/img/mach-opengraph.png"]
---

# Standalone Zig gamedev packages

Mach provides an ecosystem of 100% standalone, high-quality Zig gamedev packages - and they all feature <a href="../../about/goals#zero-fuss-installation">zero-fuss installation</a>, <a href="../../about/goals#seamless-cross-compilation">cross-compilation</a> at the flip of a switch, and <a href="../../about/goals#platform-support">broad platform support</a>.

## Who are these for?

Generally speaking, if you are using _Mach engine_ you won't be using these - as they require you to wire up everything yourself. Instead, you would be using _engine modules_ which would let you more seamlessly integrate these into your project.

If you use [Mach core](../core/) - or are just looking for high-quality standalone Zig packages, then you'd consider using these.

Additionally, we provide [C libraries & headers packaged via the Zig build system](c) which are not Zig wrappers but rather just build the respective C library and package them via the Zig build system.

## C bindings vs. pure Zig

We're not just aimlessly wrapping C libraries, here. We use C libraries generally when:

a. It is a low-level library that most Mach users would have zero need to dive into the internals of.
b. It is a clear choice, where writing our own in Zig would take a very long time.
c. It solves one problem, and solves it well. e.g. we would use GLFW for window management, not SDL, because SDL solves more than one problem.

In general, we prefer to write things in Zig and have pure-Zig options - because that means you don't need to dive into a C/C++ codebase when things go wrong or you want to change things. Of course, this must be balanced with the reality of writing complex software.

We _especially_ avoid high-level C/C++ libraries, such as e.g. Dear Imgui, because in such cases it would be very tempting to want to dive into the internals and adjust things - and we don't want our users to have to dive into a C/C++ codebase to make changes. In these cases, we intentionally make a choice to write a pure-Zig version instead, even though the initial experience results in less features and capabilities. It is the short-term price we pay to have a better long-term future.
