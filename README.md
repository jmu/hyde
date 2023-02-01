# hyde
Hyde is a brazen two-column [Bartholomew](https://bartholomew.fermyon.dev/) based on the Jekyll/Zola theme of the same name that pairs a prominent sidebar with uncomplicated content.

project based on 
* https://github.com/getzola/hyde
* https://github.com/poole/hyde


![Hyde screenshot](https://f.cloud.github.com/assets/98681/1831228/42af6c6a-7384-11e3-98fb-e0b923ee0468.png)


## Contents

- [Installation](#installation)
- [Options](#options)
  - [Sidebar menu](#sidebar-menu)
  - [Sticky sidebar content](#sticky-sidebar-content)
  - [Themes](#themes)
  - [Reverse layout](#reverse-layout)

## Installation
First download this theme to your `themes` directory:

```bash
cd themes
git clone https://github.com/jmu/hyde.git
```
and then enable it in your `site.toml`:

```toml
theme = "hyde"
```

## Options

### Sidebar menu
Set a field in `extra`:
```toml
[extra]
version = "1.0"
copyright = "The Site Authors"
time = "2023"
github = "https://github.com/fermyon"
twitter = "https://twitter.com/fermyontech"
```

### Sticky sidebar content
By default Hyde ships with a sidebar that affixes it's content to the bottom of the sidebar. You can optionally disable this by setting `hyde_sticky` to false in your `config.toml`.

### Themes
Hyde ships with eight optional themes based on the [base16 color scheme](https://github.com/chriskempson/base16). Apply a theme to change the color scheme (mostly applies to sidebar and links).

![Hyde in red](https://f.cloud.github.com/assets/98681/1831229/42b0b354-7384-11e3-8462-31b8df193fe5.png)

There are eight themes available at this time.

![Hyde theme classes](https://f.cloud.github.com/assets/98681/1817044/e5b0ec06-6f68-11e3-83d7-acd1942797a1.png)

To use a theme, set the `hyde_theme` field in `site.toml` to any of the themes name:

```toml
[extra]
hyde_theme = "theme-base-08"
```

To create your own theme, look to the Themes section of [included CSS file](https://github.com/poole/hyde/blob/master/public/css/hyde.css). Copy any existing theme (they're only a few lines of CSS), rename it, and change the provided colors.

### Reverse layout

![Hyde with reverse layout](https://f.cloud.github.com/assets/98681/1831230/42b0d3ac-7384-11e3-8d54-2065afd03f9e.png)

Hyde's page orientation can be reversed by setting `hyde_reverse` to `true` in the `site.toml`. un-do reverse, you need comment out `hyde_reverse` line.

example toml looks like this:
```toml
title = "Your Site Name"
# logo = "URL to logo"
base_url = "http://localhost:3000"
about = "This site is generated with <a href='https://bartholomew.fermyon.dev/' target='_blank'>Bartholomew</a>, the WebAssembly micro-CMS. And this message is in site.toml."
index_site_pages = ["main", "blog"]
theme = "hyde"


[extra]
version = "1.0"
copyright = "The Site Authors"
time = "2023"
github = "https://github.com/fermyon"
twitter = "https://twitter.com/fermyontech"

date_style = "%B %e, %Y"

hyde_sticky = "true"
#hyde_reverse = "false"
hyde_theme = ""
#hyde_theme = "theme-base-08"
generate_feed = "true"

```

more other spin/bart file need to config please visit [Bartholomew Themes](https://bartholomew.fermyon.dev/themes).
