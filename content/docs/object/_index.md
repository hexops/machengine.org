---
title: "Object system"
description: "Mach provides an object system which enables writing modular, reusable, high-performance code."
draft: false
layout: "docs"
docs_type: "docs"
rss_ignore: true
---

# Object system

Mach provides an object system which enables writing modular, reusable, high-performance code that represents everything from virtual objects like textures and shaders - to visual in-game objects and more.

The object system is a _foundational part of Mach_ used by every part of it. Whether you choose to use just a few parts of Mach, or embrace all of Mach, you'll be using modules and objects.

## Overview

There are a few different concepts, which when used together compose the Mach object system:

* [Modules](modules) - a collection of _global state_, _systems_, and _objects_
* [Systems](systems) - like a function, or a list of systems (functions), that could be run
* [Objects](objects) - like a slice of structs, but with various features and performance benefits
* [Relations](relations) - optionally attach objects as parents/children of other objects

## Continue reading: modules

[Object system: modules](modules)
