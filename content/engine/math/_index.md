---
title: "Math"
description: "Mach's math library aims to make it more obvious how to solve problems without having to question ground truths."
draft: false
layout: "docs"
docs_type: "engine"
rss_ignore: true
---

# A different approach

Other game math libraries often provide numerous options, e.g. providing left-handed and right-handed variants of all functions for working with different coordinate systems. They provide functionality to create projection matrices compatible with many different graphics APIs, where depth values are not the same, etc.

`mach.math` provides a more opinionated API, with less options and more ground-truths: we bless the use of Mach's coordinate system, provide fewer variants/options, and generally try to steer you in the right direction for problem solving.

If you're a seasoned game developer, this probably doesn't really matter to you. But if you're just starting out and learning, our hope is this approach is quite helpful in nudging you in the right direction!

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
