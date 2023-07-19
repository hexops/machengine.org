---
title: "About the project"
draft: false
layout: "docs"
docs_type: "about"
rss_ignore: true
---

<style>
.p-community-icon {
    height: calc(3rem + 0.5rem + 0.5rem);
    padding: 0.5rem;
    margin-bottom: 3rem;
}
img.p-community-icon {
    height: 3rem;
    /* https://codepen.io/sosuke/pen/Pjoqqp */
    filter: invert(100%) sepia(100%) saturate(0%) hue-rotate(143deg) brightness(105%) contrast(104%);
}
@media (prefers-color-scheme: light) {
    img.p-community-icon {
        filter: none;
    }
}
</style>

<div>
    <img style="height: 20rem; float: right; padding-left: 1rem;" src="../img/wrench_rocket.svg"></img>
    <p>
        <span style="font-family: Orbitron; font-size: 22px;">About the project</span>
        <br/>
        <br/>
        To learn more about Mach, understand what it is, etc. please see our <a href="../">homepage</a>, and consider joining our community:
    </p>
    <div style="display: flex; flex-direction: row; margin-top: 2rem;">
        <a href="https://discord.gg/XNG3NZgCqp" class="p-community-icon glass-link">
            <img alt="Discord" class="p-community-icon" src="/img/discord.svg">
        </a>
        <a href="https://github.com/hexops/mach" class="p-community-icon glass-link">
            <img alt="GitHub" class="p-community-icon" src="/img/github.svg">
        </a>
    </div>
</div>

<h2 style="margin-top: 0;">Early stages</h2>

Mach is still in its infancy - things are improving rapidly, not all APIs are stable, and we're missing lots of basic things. We're simple humans building towards a dream, so please try your best to help us towards that.

## Contributing

We'd love your help building Mach! There's lots to do, and little time - so whether you're an experienced gamedev, or just someone interested in learning Zig, there are likely ways you could help us towards our dreams. There are both small bugs and docs to improve, as well as large architecture challenges to sort out.

The best way to contribute is to familiarize yourself with what's missing today: there's no better way to do this than to think about what you would need to build your own game/app using it, see what you would need first hand, and then help us by proposing/discussing those changes.

Be sure to join our Discord as that lets us help you faster so we can reach the finish line sooner. :)

## Improve this site

We're very appreciative of typo fixes, documentation improvements, etc. - simply [file an issue](https://github.com/hexops/mach/issues) or [send us a pull-request](https://github.com/hexops/machengine.org/tree/main/content)!

Large design/opinionated changes can be a time sink for us and you, and can often devolve into rocket-shedding, so please don't send PRs for such - instead we prefer you simply file issues with constructive feedback (what you dislike, why, and what you would prefer) in such cases so we can take your perspective into account.
