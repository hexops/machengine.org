# machengine.org

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

## Development practices

### URL linking

We adhere to strict URL linking policies, in order to ensure that once an old version of the site is moved to a versioned URL like e.g. https://machengine.org/v0.1 that the site does not break:

* Markdown files should ALWAYS link to absolute `/foo` URLs, never relative (`foo`, `../foo`) URLs.
* HTML files should ALWAYS link to `{{$.Site.BaseURL}}/foo`, never `foo`, `/foo` or `../foo`.

### Small file hosting

Small files (images, css, fonts, etc.) should always go in the `static/` directory and be committed to this repository. To avoid bloat, we try to keep such assets small.

Linking to other sites for images/files is strictly prohibited, as we want this site to be self-contained generally.

### Video hosting

[media.machengine.org](https://github.com/hexops/media.machengine.org) exists to store and serve large files, such as videos, that are not small and shouldn't go into this repository.

Long-form videos can also be hosted on YouTube.
