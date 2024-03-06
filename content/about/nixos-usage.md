---
title: "nixOS usage"
draft: false
layout: "docs"
docs_type: "core"
rss_ignore: true
---

# Using Mach on nixOS

If you use nixOS and want to use Mach, this document is for you.

## usage via nix-ld (preferred, requires unstable)

Use [nix-ld](https://github.com/Mic92/nix-ld) following e.g. [this article](https://blog.thalheim.io/2022/12/31/nix-ld-a-clean-solution-for-issues-with-pre-compiled-executables-on-nixos/).

For example this shell:

```nix
with import <nixpkgs> {};
mkShell {
  NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
    pkgs.xorg.libX11
    pkgs.vulkan-loader
  ];
  NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";
  shellHook = ''
    export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
  '';
}
```

Then running `zig build` as usual:

```sh
zig build run-core-textured-cube
```

## Usage via shell

```nix
{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [
    pkgs.xorg.libX11
    pkgs.vulkan-loader
  ];
  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.xorg.libX11}/lib:${pkgs.vulkan-loader}/lib:$LD_LIBRARY_PATH
  '';
}
```

## Usage via steam-run

You can also run Mach examples via `steam-run`, for this you will need to install Steam, then create a shell using steam-run, e.g.:

```sh
env NIXPKGS_ALLOW_UNFREE=1 nix-shell -p steam-run
```

(then `zig build run-core-textured-cube` as usual)

## Known issues
### Incorrect cursor behavior with cursormode set to disabled

If your cursor is not hidden and behaves "jumpy" after setting cursormode to disabled, you will need to add the `pkgs.xorg.libXcursor` package as an additional buildinput. This is required for both Xorg and Wayland.

If capturing the cursor is not required, libXcursor can be omitted.

## Debugging tips

* Mach requires a functional Vulkan graphics driver by default, but you can also try OpenGL via `MACH_GPU_BACKEND=opengl`
* Poor vsync implementations on Linux may make the application appear laggy, [you may need a frame rate limiter](https://github.com/hexops/mach/issues/444#issuecomment-1369186927) (please let us know if you run into this.
* OpenGL ES fallback is [not yet supported](https://github.com/hexops/mach/issues/471)
* [`VK_ERROR_INCOMPATIBLE_DRIVER`](https://github.com/hexops/mach/issues/458) may be encountered if your GPU does not support Vulkan / the version we require, please try `MACH_GPU_BACKEND=opengl` if so.
