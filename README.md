# [machengine.org](https://machengine.org) <a href="https://hexops.com"><img align="right" alt="Hexops logo" src="https://raw.githubusercontent.com/hexops/media/main/readme.svg"></img></a>

The [machengine.org](https://machengine.org) website.

## Issues

Issues are tracked in the [main Mach repository](https://github.com/hexops/mach/labels/website).

## Main branch vs. non-main branches

The main branch always has the latest version of the site deployed at https://machengine.org

Non-main branches exist, where are deployed to subdirectories:

* `v0.1` -> https://machengine.org/v0.1
* `next` -> https://machengine.org/next
  * This branch is only used temporarily, if we are in the process of some major design / rework of
    the site and do not wish to disturb users of the existing site while we figure things out. This
    branch is always eventually promoted to `main`, and then the `/next` URL goes away for good.

Non-main branches are configured in a few special ways. When creating a new branch, search for `Important: This should be configured according to the branch.` and update all such locations. This includes things like changing the base URL of the site, preventing Google from indexing this non-main version, etc. 
