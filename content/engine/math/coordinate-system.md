---
title: "Coordinate system"
description: "Mach uses a (+Y up, left-handed) coordinate system, matching WebGPU, Metal, D3D12, and Unity3D. Included is a helpful diagram for you."
draft: false
layout: "docs"
docs_type: "engine"
rss_ignore: true
---

# Coordinate system

This page briefly covers Mach's coordinate systems; then it delves into _traversing coordinate systems_ explaining at a high-level (and with very minimal maths) how e.g. a polygon in a 3D model in the scene goes through a bunch of coordinate system transforms before finally ending up as a pixel on the screen.

You don't have to read this whole page, but it might be worth skimming and taking a look at the diagrams!

## World space

<a href="/img/coordinate-system.png?v2"><img src="/img/coordinate-system.png?v2"></a>

3D models and 2D sprites are said to exist in **world space**, Mach uses a '**+Y up, left-handed**' coordinate system to represent objects in space. To visualize it, imagine your own eyes are the camera. Hold your left hand out in front of you in a thumbs-up pose, as if you were holding a stick:

* X goes through the back side of your palm, towards your fingernails
* Y goes through the bottom of your hand towards the tip of your thumb
* Z goes through your eyes and towards your thumb
* Positive rotation values follow the direction of your fingers curled around the stick (any axis)

## Quick reference

| What                                | Coordinate system                             |
|-------------------------------------|-----------------------------------------------|
| World space                         | +Y up, left-handed                            |
| Texture coordinates                 | +Y down; (0, 0) is at the top-left corner and the first texel in memory address order. (1, 1) is the last texel in memory address order. |
| Framebuffer coordinates             | +Y down; (0, 0) is at the top-left corner     |
| Normalized device coordinates (NDC) | +Y up; (-1, -1) is at the bottom-left corner  |

## Mach vs. other software

If you are familiar with other software / APIs, the following comparison tables may be helpful:

<a href="/img/coord-comparison.png"><img src="/img/coord-comparison.png"></a>
<a href="/img/texcoord-comparison.png"><img src="/img/texcoord-comparison.png"></a>

## Traversing coordinate systems

Suppose that you have a 3D model placed in a scene, and a virtual camera is viewing it. How do the vertices of that model ultimately end up on the 2D screen? We'll walk through this below, one coordinate system transformation at a time!

<a href="/img/vertex-to-pixel.png"><img src="/img/vertex-to-pixel.png"></a>

### Cartesian coordinate system transformations

First we need to know what a coordinate system transformation is. Imagine a typical 3D grid like you'd find in a 3D model editor, such as Blender. That's a 3D [cartesian coordinate system](https://en.wikipedia.org/wiki/Cartesian_coordinate_system) - the linear axis in X, Y, and Z dimensions.

Pick any point on that grid. Then imagine a second grid / coordinate system, overlayed exactly with the other one. But this one you can move, rotate, scale, etc.! As you do, the point you chose on the first grid remains in the same location.. but in the 2nd grid its location changes depending on how you move/rotate/scale the grid!

The fact that we can take a point anywhere in the first grid, and determine where it would be in the 2nd grid which is moved/rotated/scaled, is a coordinate system transformation and is _what a matrix transformation does_. Keep this in mind as you think about the transformations we describe later.

<a href="/img/coordinate-system-transformation.png"><img src="/img/coordinate-system-transformation.png"></a>

### Model -> World space

Now that we understand what a coordinate system transformation is, we can begin talking about the first one we need to perform: Model -> World space. Imagine a vertex on a 3D model: the point of a diamond floating in front of a monkey

This vertex is said to be in the _local space of the model_, or just 'model space' for short. We get to decide what unit of measurement is used, as long as we're consistent everywhere - so let's say our unit is _meters_. The position of this vertex at the tip of the monkey's hand is `(0, 0, 1)` _in model space_: 'one meter in front' of the monkey, from the perspective of the monkey. It doesn't matter where the monkey is located in the world, that vertex is always at `(0, 0, 1)` _in model space_ because it is from the perspective of the monkey.

The **Model matrix** describes how to _transform_ a point _in model space_ into _world_ space, so that we can say 'the monkey's finger tip' is at a specific point in the world, rather than being relative to the monkey's location/rotation/scale/etc.

<a href="/img/model-to-world-space.png"><img src="/img/model-to-world-space.png"></a>

### World -> View space

Next up, we need to convert from _world space_ into _view space_. Just like how _model space_ is relative to the model, _view space_ is relative to the _viewer_ (i.e. the virtual camera of the scene) - this lets us say "this vertex in the 3D world is at (x, y, z) _relative to the camera/viewer._"

This is like the opposite of what we just did above: going from Wrench's local model space to world space. Instead, we're going from world space to the camera's local space.

### View -> Clip space

Now that we know where the point is in view space / relative to the camera, we need to transform the vertex into _clip space_. A _projection matrix_ is used for this, taking 3D points relative to the viewer, and transforming them into a _normalized clip space bounding box_.

<a href="/img/projection-matrix.png"><img src="/img/projection-matrix.png"></a>

Notice how the view frustum above represents a sort of virtual camera lens, with the far plane being much larger than the near plane. The shape of the view frustum is what makes our geometry look like it is in 3D space, objects further away from will appear smaller and objects closer to the camera will appear larger. For 2D games, an [orthographic projection matrix](https://i.stack.imgur.com/4bRUu.png) is used instead of the 'warped' perspective projection matrix shown above.

Also note that the view frustum is where we take into account the aspect ratio and field-of-view. For 2D games, the orthographic projection matrix often e.g. determine how many world-space units map to a single fragment/pixel on screen.

The clip space volume / bounding box on the right is a concept defined by the underlying graphics APIs and hardware. When a _vertex shader_ runs on every vertex of a 2D/3D model, its goal is to output the position of the vertex _in clip space_. Unlike our other 3D coordinate spaces so far, clip space is a _4D homegenous space_ - also known as a ['_projective space_'](https://www.tomdalling.com/blog/modern-opengl/explaining-homogenous-coordinates-and-projective-geometry/).

#### Projective geometry

In all our other 3D coordinate systems so far, we've been thinking in terms of Euclidean geometry with `[x, y, z]` points. But in clip space, we need to think in terms of _Projective geometry_ instead with `[x, y, z, w]`, where 𝑊 acts basically as a _scaling transformation_ for the 3D coordinate - which will be used in our next transformation.

<a href="/img/2d-projective-space.png"><img src="/img/2d-projective-space.png"></a>

The above diagram shows _2D projective space_, with `[x, y, 𝑊]` - but clip space on GPUs is in _3D projective space_, with `[x, y, z, 𝑊]` components. It's hard to visualize adding another dimension to the diagram above (a projector which exists in 4D, and projects _onto 3D space_) - so you'll have to use your imagination - but how 𝑊 works remains: as it increases, the coordinate `[x, y, z]` _expands_ (scales up) and when 𝑊 decreases, the coordinate `[x, y, z]` _shrinks_ (scales down). Each vertex can have its own 𝑊 value, and so each vertex effectively lives in its own unique projective clip space. The 𝑊 is basically a _scaling transformation_ for the 3D coordinate.

#### Clip space continued

The vertex shader (i.e., you) are responsible for producing that four-dimensional vertex position _in clip space_. Vertices form primitive shapes (like triangles), and when they go beyond the bounds of that _clip space volume / bounding box_ in the diagram shown earlier, or if they intersect it, the GPU will _clip them_. You can literally think of a piece of paper in the shape of a triangle, then imagine using scissors to _clip_ a portion of the triangle off!

Anything that is outside the clip space volume / bounding box, any points that do not pass the following tests, will be _clipped_:

* −p.𝑊 ≤ p.x ≤ p.𝑊
* −p.𝑊 ≤ p.y ≤ p.𝑊
* 0 ≤ p.z ≤ p.𝑊 (depth clipping, optional)

GPUs use the clip volume to determine what actually needs to be rendered. Fragments/pixels/vertices outside of this clip volume, anything off-screen or behind the viewer/camera, do not need to be rendered.

### Clip space -> NDC

Finally it is time to perform the _perspective divide_, and get our clip-space coordinates into _normalized device coordinates (NDC)_.

<a href="/img/clip-space-to-ndc.png"><img src="/img/clip-space-to-ndc.png"></a>

Much like clip space, NDC is a bounding box:

* -1.0 ≤ x ≤ 1.0
* -1.0 ≤ y ≤ 1.0
* 0.0 ≤ z ≤ 1.0
* The bottom-left corner is at (-1.0, -1.0, z).

To convert from clip space -> NDC, we perform the perspective divide, take the (x, y, z) components and dividing each by the 𝑊 component, this converts a 4D clip-space coordinate into 3D space once again.

### Rasterization

Multiple vertices in normalized device coordinates make up primitive shapes (like triangles), which the GPU performs [rasterization](https://www.w3.org/TR/webgpu/#rasterization) on, rendering to fragments in the framebuffer, depth buffer, etc. This involves many other aspects we won't go into here: multisampling, depth testing, front/back-face culling, stenciling, scissor operations, and more! It also involves running your _fragment shader_ for each fragment that would end up in the framebuffer and, ultimately, as a pixel on the screen.

What we will explain here is how normalized device coordinates end up mapping to framebuffer space, though!

### Normalized device coordinates

Here you can see how normalized device coordinates would map to e.g. a fullscreen window.

<a href="/img/normalized-device-coordinates.png"><img src="/img/normalized-device-coordinates.png"></a>

(x=0, y=0) is always the center of the framebuffer, whether it's a window, a fullscreen application, running at any resolution - it's always the center! (-1, -1) is always the bottom-left, and (1, 1) the top-right. The Z axis extends from z=0 (the surface of your screen) *into* it at z=1.

### Framebuffer coordinates

<a href="/img/framebuffer-coordinates.png"><img src="/img/framebuffer-coordinates.png"></a>

It's worth noting that _framebuffer coordinates_ are not always the same thing as _pixels_. Framebuffers hold _fragments_, the smallest possible little dot of light, pixel is also a fine name! But as displays became ever higher and higher in their resolutions, OS developers decided that _physical pixels_ (fragments) and _virtual pixels_ used to position things on screen, would be different concepts. Blegh!

For example.. you may create a window on your screen which is 720x480px. On a machine with an older display/monitor/OS version, that may mean you get a 720x480px _framebuffer_, everything matches, great! But on a newer system with a HDPI display, you may find that your 720x480px window has a framebuffer resolution of _twice that_, at 1440x960px(!) because one _virtual pixel_ maps to four (2x2) _physical pixels_ on the display!

macOS, Windows, Linux, and cellphones all have this distinction today between physical and virtual pixels. Some platforms (e.g. Linux) allow for _fractional scaling_, where e.g. a virtual pixel may be made up of say 2.1 physical pixels, so your 720px wide window might end up being 1512px wide, funky!

The key thing here to keep in mind is just that the _window resolution != framebuffer resolution_, you're always rendering pixels into the framebuffer, and that resolution may not be the same as the window size itself - so you may need to convert between the two.

### You are now a multidimensional wizard!

You're now capable of traversing the various coordinate systems, to 4D space and back again - or, at least, hopefully you have a clearer picture of the parts involved in getting a _vertex in the 3D world_ to end up on the screen at the end of the day.
