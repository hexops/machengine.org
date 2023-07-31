---
title: "Coordinate system"
description: "Mach uses a (+Y up, left-handed) coordinate system, matching WebGPU, Metal, D3D12, and Unity3D. Included is a helpful diagram for you."
draft: false
layout: "docs"
docs_type: "engine"
rss_ignore: true
---

# Coordinate system (+Y up, left-handed)

* Normalized Device coordinates: +Y up; (-1, -1) is at the bottom-left corner.
* Framebuffer coordinates: +Y down; (0, 0) is at the top-left corner.
* Texture coordinates:     +Y down; (0, 0) is at the top-left corner.

## Diagrams (placeholder image)

<img width="400px" src="/img/coordinate-system.png">

## Why?

You can use other coordinate systems if you need to, of course, by converting between them - but it intentionally won't be as convienient to use with mach-math. Our coordinate system was chosen largely for consistency with other popular APIs' defaults:

* WebGPU  (+Y up, left-handed)
* Metal   (+Y up, left-handed)
* D3D12   (+Y up, left-handed)
* Unity3D (+Y up, left-handed, note their texture coordinates are (0, 0) bottom-left)

Software which doesn't match our coordinate system:

* Blender (+Z up, right-handed)
* Unreal  (+Z up, left-handed)
* OpenGL  (+Y up, right-handed)
* Vulkan  (-Y up, right-handed)
* Godot   (+Y up, right-handed)
