---
title: "Matrix storage"
description: "Matrices in Mach are OpenGL-style, column-major with column-vectors, i.e. right-associative multiplication in the form matrix * vector = vector."
draft: false
layout: "docs"
docs_type: "docs"
rss_ignore: true
---

# Matrix storage

Matrices in Mach use:

* Column-major matrix storage
* Column-vectors (i.e. right-associative multiplication, matrix * vector = vector)

The benefit of using this "OpenGL-style" matrix is that it matches the conventions accepted by the scientific community, it's what you'll find in linear algebra textbooks. It also matches WebGPU, Vulkan, Unity3D, etc. It does NOT match DirectX-style which e.g. Unreal Engine uses.

**Note:** many people will say "row major" or "column major" and implicitly mean three or more different concepts; to avoid confusion we'll go over this in more depth below.

## Should you read the rest of this page?

Before we continue, it's worth asking if you want to read the rest of this page. If you're keen to understand how things work behind the scenes, and why they work this way, then read on! If you just want to get started making a game, this is probably _the most_ dense topic in the Mach documentation, so maybe just keep a link to it in your back pocket.

## Mathematical matrix order: row-major, column-vectors

Mathematically, a matrix is defined as `m x n`, where `m` is the number of rows (horizontals) and `n` is the number of columns (verticals.) For example, this 4x4 matrix where `a10` (zero-indexed) represents the element at the second row and first column of the matrix:

```
|a00 a01 a02 a03|
|a10 a11 a12 a13|
|a20 a21 a22 a23|
|a30 a31 a32 a33|
```

Take note of how the mathematical definition and convention used here is _rows x columns_, an arbitrary choice the science community made to agree rows come first, partly influenced by the fact that English is row-major (read left-to-right, top-to-bottom). This is just a convention and has NOTHING to do with a matrix is stored on a computer. This decision was made because it is nicer to write e.g. matrix translation*vector multiplication on paper like this:

```
|1 0 0 tx| |x|   |x+w*tx|
|0 1 0 ty| |y| = |y+w*ty|
|0 0 1 tz| |z|   |z+w*tz|
|0 0 0 tw| |1|   |tw    |
```

Instead of like this:

```
          |1  0  0  0 |
|x y z 1| |0  1  0  0 | = |x+w*tx, y+w*ty, z+w*tz, tw|
          |0  0  1  0 |
          |tx ty tz tw|
```

Both of these equations are equal and produce the same result, they're just written differently, mathematicians and the rest of the science community agreed the first one is right and moved on.

Take special note of how in the first example, the vector `[tx, ty, tz, tw]` is stored in the fourth _column_ of the matrix, suggesting we have _column vectors_. In the second example, the same vector is stored in the fourth _row_ of the matrix, suggesting we have _row vectors_.

It is also worth noting that as a result of using _column vectors_, we have right-associative multiplication (the matrix goes on the left, vector on the right; matrix * vector), whereas with _row vectors_ we use left-associative multiplication (the matrix goes on the right, vector on the left; vector * matrix.)

You should now have the following ground-truths:

1. +The mathematical convention is to write matrices in row-major order, using column-vectors.

## "Programming languages are X order"

Programming languages are sometimes said to be in a row-major order or column-major order. Most programming languages, like C, C++, Zig, Rust, etc. are considered to be row-major, because if we give you e.g. this translation matrix, written in the standard mathematical convention where `[tx, ty, tz, tw]` is a _column-vector_:

```
|1 0 0 tx|
|0 1 0 ty|
|0 0 1 tz|
|0 0 0 tw|
```

And we ask you write it in code as a 2D array with the same visual layout:

```zig
const m = [4][4]f32{
    .{1, 0, 0, tx},
    .{0, 1, 0, ty},
    .{0, 0, 1, tz},
    .{0, 0, 0, tw},
};
```

And then ask you to extract the `[tx, ty, tz, tw]` vector, you will find that you need to index into all four _rows of the matrix_, the elements of that vector are stored at memory offsets 3, 7, 11, and 15 - not contiguously in memory. In contrast, if we were to write our matrix in code as:

```zig
const m = [4][4]f32{
    .{ 1,  0,  0,  0},
    .{ 0,  1,  0,  0},
    .{ 0,  0,  1,  0},
    .{tx, ty, tz, tw},
};
```

Then we will find that our `[tx, ty, tz, tw]` vector is conveniently in contiguous memory at offsets 12, 13, 14, and 15. `m[3]` _is_ the vector we wanted to extract!

You should now have the following ground-truths:

1. The mathematical convention is to write matrices in row-major order, using column-vectors.
2. +Many programming languages are said to be in row-major order, because a 2D array written in
    code matching the mathematical convention results in rows, not columns, being stored in
    contiguous memory.

## The two devils of graphics programming

Unlike the science community, graphics programmers never agreed universally on whether to use row-vectors or column-vectors, or whether to use row-major or column-major storage. Although there are two independent options you should be aware of (vector type and storage type), in practice there are usually only two styles used:

* DirectX-style: row-major storage, using row-vectors
  * Descendants like Unreal Engine, HLSL, Cg, etc. use this style.
  * The `[tx, ty, tz, tw]` vector is stored in memory offsets 12, 13, 14, and 15.
* OpenGL-style:
  * column-major storage, using column-vectors
  * Descendants like Unity, GLSL, WebGPU, Vulkan, Metal, WebGL, etc. use this style
  * The `[tx, ty, tz, tw]` vector is stored in memory offsets 12, 13, 14, and 15.

If you're paying close attention, you'll notice that we said the `[tx, ty, tz, tw]` vector is stored in the same offset in-memory. How can this be? The answer lies in the _mathematical convention_ that each have chosen. OpenGL-style chooses the standard mathematical convention:

```
|1 0 0 tx| |x|   |x+w*tx|
|0 1 0 ty| |y| = |y+w*ty|
|0 0 1 tz| |z|   |z+w*tz|
|0 0 0 tw| |1|   |tw    |
```

While DirectX-style chooses a different convention which the science community would disagree with if they had a voice in the matter:

```
          |1  0  0  0 |
|x y z 1| |0  1  0  0 | = |x+w*tx, y+w*ty, z+w*tz, tw|
          |0  0  1  0 |
          |tx ty tz tw|
```

When you store the OpenGL-style in column-major storage, the `[tx, ty, tz, tw]` vector ends up at memory offsets 12, 13, 14, and 15 in contiguous memory.

When you store the DirectX-style in row-major storage, the `[tx, ty, tz, tw]` vector _also_ ends up at memory offsets 12, 13, 14, and 15 in contiguous memory.

What is affected, however, is the multiplication order: with OpenGL-style, you use `matrix*vector` as is standard in the scientific community; while with DirectX-style you use `vector*matrix`.

## Endless confusion

It's very easy to get yourself mixed up. It's also possible to diverge from the OpenGL/DirectX styles, for example by using column-major storage with row-vectors. Because of the fact that transposing from one to the other is trivial, it's also very possible to end up using two different conventions at the same time. This is an endless source of confusion in the computer graphics community, and there is a lot of incorrect information about the topic online.

Two good sources of information are:

1. https://fgiesen.wordpress.com/2012/02/12/row-major-vs-column-major-row-vectors-vs-column-vectors/
2. https://en.wikipedia.org/wiki/Row-_and_column-major_order
