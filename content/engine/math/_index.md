---
title: "Math"
description: "Mach's math library provides a more opinionated API and less options, making it more obvious how to solve problems without having to question ground truths."
draft: false
layout: "docs"
docs_type: "engine"
rss_ignore: true
---

# Mach's math library is opinionated

Other math libraries often provide many options, e.g. providing LH and RH (left-handed and right-handed) variants of functions for working with different coordinate systems. They provide functionality to create projection matrices compatible with many different graphics APIs.

`mach.math` provides a more opinionated API, with less options and more ground-truths. We bless the use of Mach's coordinate system, provide few variants/options, and generally try to steer you in the right direction for problem solving.

If you're a seasoned game developer, this probably doesn't matter much to you. But if you're just getting into gamedev and learning, our hope is it's quite helpful in nudging you in the right direction!

## Matrices

* Column-major matrix storage
* Column-vectors (i.e. right-associative multiplication, matrix * vector = vector)

The benefit of using this "OpenGL-style" matrix is that it matches the conventions accepted by the scientific community, it's what you'll find in linear algebra textbooks. It also matches WebGPU, Vulkan, Unity3D, etc. It does NOT match DirectX-style which e.g. Unreal Engine uses.

Note: many people will say "row major" or "column major" and implicitly mean three or more different concepts; consider reading the [matrix storage docs](matrix-storage).

## Coordinate system (+Y up, left-handed)

* Normalized Device coordinates: +Y up; (-1, -1) is at the bottom-left corner.
* Framebuffer coordinates: +Y down; (0, 0) is at the top-left corner.
* Texture coordinates:     +Y down; (0, 0) is at the top-left corner.

This coordinate system is consistent with WebGPU, Metal, DirectX, and Unity (NDC only.)
