---
title: "Migration notes - Mach core & libraries"
description: "In the event of a breaking change, this page details any migration steps neccessary to upgrade your code to the latest version of Mach core or one of our standalone libraries."
draft: false
layout: "docs"
docs_type: "core"
rss_ignore: true
---

# Migration notes

To learn more about Mach's library stability guarantees, check out the [libraries overview](../libs) page. This page provides migration guides for Mach libraries-walking you through how to update your code to the latest version.

## mach-core: multithreaded rendering & standalone usage

mach-core is now available as a 100% standalone repository/library. The documentation has been updated to reflect this.

Additionally, we have landed [multi-threaded rendering support](https://github.com/hexops/mach-core/pull/15) which allows native applications to run at e.g. 60FPS while handling input events at 240hz. Additionally, it enables butter-smooth window resizing.

## mach-glfw: package manager usage

If you are a user of mach-glfw, note that we have adopted the experimental Zig package manager. It is not perfect yet and there are many papercuts; for details on how to update your codebase [please see this](https://github.com/hexops/mach/issues/861#issuecomment-1638185447)

## mach-core: v0.2 API redesign
<div class="subtext">2023-01-27 - affects all mach/core users</div>

Mach v0.2 brings a complete redesign of the mach/core API. To upgrade your application see [the upgrade guide](2023-core-api)

## mach-glfw: error handling improvements
<div class="subtext">2023-01-10 - affects all mach/glfw users</div>

We've made another error handling improvement to the `mach/glfw` API:

- `glfw.getError` has been renamed to `glfw.getErrorCode` (returns a Zig error type still)
- `glfw.getError` instead now returns a struct with _both_ the error message and Zig error type.
- `glfw.clearError` has been added, a smaller helper to make writing `defer glfw.clearError()` nicer than before (`defer glfw.getErrorCode() catch {};`).

* [More information](https://github.com/hexops/mach/pull/668)

## glfw: error handling changes
<div class="subtext">2023-01-08 - affects all mach/glfw users</div>

We have completely overhauled the mach/glfw error handling approach to help users better avoid footguns and ultimately improve the ability of Zig GLFW applications to run on more obscure X11 window managers and Wayland in general.

* [More information](https://github.com/hexops/mach/pull/662)
* How to update: please see "The solution" in https://github.com/hexops/mach/pull/662
