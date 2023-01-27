---
title: "Migration notes - Mach core & libraries"
description: "In the event of a breaking change, this page details any migration steps neccessary to upgrade your code to the latest version of Mach core or one of our standalone libraries."
draft: false
layout: "docs"
rss_ignore: true
---

# Migration notes

To learn more about Mach's library stability guarantees, check out the [libraries overview](../libs) page. This page provides migration guides for Mach libraries-walking you through how to update your code to the latest version.

## core: v0.2 API redesign
<div class="subtext">2023-01-27 - affects all mach/core users</div>

Mach v0.2 brings a complete redesign of the mach/core API. To upgrade your application see [the upgrade guide](2023-core-api)

## glfw: error handling improvements
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
