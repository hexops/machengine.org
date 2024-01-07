---
title: "Style guide"
description: "The Mach code style guide; Fast doesn't mean reckless, we follow these rules to keep our code readable and high-quality."
draft: false
layout: "docs"
docs_type: "about"
rss_ignore: true
---

# Style guide

## Use `mach.testing` where applicable

In the [main Mach repository](https://github.com/hexops/mach) we have the [`mach.testing`](https://github.com/hexops/mach/blob/main/src/testing.zig) module, which provides alternatives to `std.testing` equality methods with:

* Less [ambiguity about order of parameters](https://github.com/ziglang/zig/issues/4437)
* Approximate absolute float equality by default
* Handling of vector and matrix types

You should use `mach.testing` wherever it is accessible (without pulling in an additional dependency.)

## `usingnamespace` is prohibited

`usingnamespace` in general is prohibited from use in Mach code, it allows one to 'mixin' namespaces and in our view tends to produce increasingly worse code quality over time. See e.g. [ziglang/zig#9618](https://github.com/ziglang/zig/pull/9618), and [hexops/mach#396](https://github.com/hexops/mach/issues/796)

We've successfully banished `usingnamespace` in general, and there are very few situations where its removal does not improve code quality & legiblity in our view.

```zig
// This is prohibited!
pub usingnamespace @import("foo.zig");

// This is allowed
pub const bar = @import("foo.zig").bar;
pub const baz = @import("foo.zig").baz;
// ...
```

If you find that writing all of the `pub const y = x.y` is too tedious, and you're doing it 50+ times or something crazy - that is a perfect signal that your code layout is poor and you should move `y` directly into whatever file you are writing `pub const y = x.y` in.

**Exception:** There are exceptions to this rule, places where you really, genuinely do require a way to express a comptime struct mixin. This is only applicable when you are trying to e.g. create structs at comptime, not when trying to structure code. These cases should be extraordinarily rare. For example, mach-core requires [exactly one such usage](https://github.com/hexops/mach-core/blob/50930539c32630b8054ecd48b443c7e336780da4/src/platform/native/main.zig#L6-L7) because we depend on magic `@import("root")` usages to let users configure e.g. logging in the Zig standard library, even though we're writing their `main.zig` entrypoint file for them.

## Test names should be snake_case and descriptive

Do this:

```
test "vec_dot" { ... }
test "vec_dot_zero_inputs" { ... }
```

Not this:

```
test "vec.dot" { ... }
test "vec.dot(0)" { ... }
```

## Tests should be small and contain a single test only

Do this:

```
test "vec_dot" {
    // test 1
}
test "vec_dot_zero_inputs" {
    // test 2
}
```

Not this:

```
test "vec.dot" {
    {
        // test 1
    }
    {
        // test 2
    }
}
```
