# TinyWebEx

The _TinyWebEx_ modules are a collection of [ES6 JavaScript modules](https://hacks.mozilla.org/2015/08/es6-in-depth-modules/) for [WebExtensions](https://developer.mozilla.org/docs/Mozilla/Add-ons/WebExtensions), also called add-ons in the Mozilla world.
They make common tasks you need to do in your add-on simpler without requiring you to ship with a lot of dependencies (that's why we call them _tiny_). This is also made possible, because we do not support older browsers.
They are also well-tested with unit tests and [in real world](#users).

Usually, you can also use all modules independently of each other, but sometimes they have to depend on each other for obvious reasons.

A full JSDOC documentation and human-readable overview documentation is also available for each add-on.

## Overview

* **[AddonSettings](https://github.com/TinyWebEx/AddonSettings)** – Retrieve and save your add-on settings easier, providing default values and [managed options](https://developer.mozilla.org/docs/Mozilla/Add-ons/WebExtensions/API/storage/managed).
* **[AutomaticSettings](https://github.com/TinyWebEx/AutomaticSettings)** – Define all your settings for your options in HTML and they are automatically loaded and saved on each change. Supports everything which _AddonSettings_ supports, too. (default options, managed options)
* **[BrowserCommunication](https://github.com/TinyWebEx/BrowserCommunication)** – module for showing messages of all sort, supports pre-defined or custom message types.
* **[Localizer](https://github.com/TinyWebEx/Localizer)** – Easily translate the whole HTML of your browser extension.
* **[Logger](https://github.com/TinyWebEx/Logger)** – A custom console.log replacement (overwrite possible) to add more details etc.
* **[MessageHandler](https://github.com/TinyWebEx/MessageHandler)** – module for showing messages of all sort, supports pre-defined or custom message types.
* **[RandomTips](https://github.com/TinyWebEx/RandomTips)** – module for showing an unobtrusive random tip to the user, depends on _MessageHandler_.

### Special repos

There are also these special repos:
* **[this repo here](https://github.com/TinyWebEx/common)** – containing common files for add-ons or the TinyWebEx project.
* **[AddonTemplate](https://github.com/TinyWebEx/AddonTemplate)** – a template for a new add-on to quickly get started
* **[TinyWebEx-UnitTests](https://github.com/TinyWebEx/TinyWebEx-UnitTests)** – a collection (git submodules) of all modules to easily unit-test all of them
* **[TestHelper](https://github.com/TinyWebEx/TestHelper)** – small scripts (helpers) only used for/in unit tests

### Third-party dependencies

Also, we sometimes depend on [lodash](https://github.com/lodash/lodash). However, really, only rarely, and only some hand-picked modules that are also recommend to be included manually (the few modules it needs, not all of lodash).

You can usually always use the master branch of lodash.
Unfortunately, these modules need to be copied by hand.
(TODO: maybe make an own repo with all needed ones)

What lodash modules may be used is documented with JSDoc

## Getting started

If you want to create a new add-on, there is a whole template for it: [AddonTemplate](https://github.com/TinyWebEx/AddonTemplate)

If you want to include them in your add-on, best is to create a dir (I use `common/modules`.), where you can clone all repositories into.
Then, your directory structure in there e.g. looks like this:
```
.
├── AddonSettings
│   ├── AddonSettings.js
│   ├── CONTRIBUTORS
│   ├── LICENSE.md
│   └── README.md
├── data
│   ├── ...
│   └── DefaultSettings.js
...
```

We actually recommend to use [git submodules](https://github.blog/2016-02-01-working-with-submodules/).
See [the paragraph below](#what-you-need-to-know) on why you need to do so.

Each module defines in their Readme, how to include and use it.

## What you need to know

Due to the way we use static ES6 modules, there are some inconveniences I have to make you aware of:
* Many modules depend on each other, and you need to manually clone them into the right location. (It's easy, as it is) We recommend to use [git submodules](https://github.blog/2016-02-01-working-with-submodules/).
* Likewise, many modules depend on some data you add as a developer. This is also always documented in the corresponding module, but you usually just drop a JS file in the `https://github.com/TinyWebEx/data` dir (seen from the module).
* We use the standardized APIs, [as supported by Firefox](https://developer.mozilla.org/Add-ons/WebExtensions/Porting_a_Google_Chrome_extension). Possibly [you need to use this polyfill](https://github.com/mozilla/webextension-polyfill) to support other browsers.
* Similarly (especially for CSS), we follow the Firefox guides, e.g. the [Firefox photon design guide](https://design.firefox.com/photon/).
* Usually, we require at least Firefox 60. (but each repo contains a `manifest.json` that lists all requirements, including permissions and minimum Firefox version.
* We sometimes depend on/require lodash, see [the section on “third-party dependencies”](#third-party-dependencies).

## Users

These modules are used in production by several add-ons.

Most notably:
* [Offline QR Code Generator](https://github.com/rugk/offline-qr-code/)
* [Awesome Emoji Picker](https://github.com/rugk/how-did-i-get-here/)
* [Mastodon Simplified Federation](https://github.com/rugk/mastodon-simplified-federation/)
* [Dark Mode Website Switcher](https://github.com/rugk/website-dark-mode-switcher/)

As such, I re-use things like the [CONTRIBUTING.md](./CONTRIBUTING.md) in their, respectively link to it.
