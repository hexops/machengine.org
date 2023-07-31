---
title: "Stability"
description: "We haven't reached Mach 1 yet, but Mach encompasses many projects and some are more stable than others."
draft: false
layout: "docs"
docs_type: "about"
rss_ignore: true
---

# What stability means to us

We haven't reached Mach 1 yet, but Mach encompasses many projects and some are more stable than others.

| Area     | Stability    | Notes                                          |
|----------|--------------|------------------------------------------------|
| Engine   | Experimental | We expect many things to change before Mach 1. |
| Core     | Stable       | We expect some API breaking changes as we add support for more platforms, add small features, etc. |
| Packages | - | Depends on the package, experimental packages will have a clear warning in the README. |

## Mach is romantically versioned

When there are new features, bug fixes, etc. that are major, we want to be able to communicate those to people in a meaningful way. For example, if you see a "Mach v1 released" blog post, we want you to know that is a _major_ event - the delta between major versions doesn't just mean an API-breaking change was made, it means something really big/important for our users - the project might look totally different between v1 and v2.

Similarly, If you see a "Mach v1.1 released" blog post, we want you to know that we continued on the same general direction of the project and made great headway. That might be the result of several months, or even a year of work, features, polish, and bug-fixes.

As a result, Mach is romantically versioned, not semantically versioned.

## Communicating stability

Although Mach is romantically versioned, we still have a responsibility and duty to clearly communicate to our users what is stable and what isn't. Additionally, there are systems that may arise in the future (such as the Zig package manager adopting minimum-version-selection) which may impact us.

We communicate stability and instability through two mechanisms today:

## What "stable" means

When we say a project is stable, we mean:

1. We believe the scope of the project has been generally solidified, and its API/design choices are generally set in stone.
2. We may still make _API breaking changes_, such as to add new features, improve the API design, or account for Zig changes. **However** it is our responsibility to _communicate those changes clearly_ so that it is _obvious_ how you can upgrade your own code to the latest API.

We believe this gives us the flexibility to improve projects, as we're not locked into specific API design choices, and can balance/judge the impact of making such changes on a case-by-case basis rather than using a strict semantic definition of API compatibility. In other words, when we get something wrong, we'll be able to actually fix it.

**With stable projects, we maintain _migration notes_** where we clearly document API changes and how to upgrade your code. For example, see [mach-core's migration notes](../core/migrations).

## What "experimental" means

When a project has an experimental warning, it means all bets are off. You should carefully read the warning to understand why the project is experimental, and assume the worst.

It could be the case that the project is nearing 'stable' status, and only a few minor issues remain. Or it could mean that we're not even sure that project should be a part of what we're building, and is subject to being removed completely in the future.
