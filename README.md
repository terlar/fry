# fry [![Build Status](https://travis-ci.org/terlar/fry.png?branch=master)](https://travis-ci.org/terlar/fry)

A simple ruby version manager for [fish](https://github.com/fish-shell/fish-shell).

## Installation

```sh
git clone git://github.com/terlar/fry.git
cd fry
make install
```

Add the following to the `~/.config/fish/config.fish` file:

```sh
. /usr/local/share/fry/fry.fish
```

### Arch Linux

`fry` is also available for Arch Linux in the [AUR](https://aur.archlinux.org) as the package [fry](https://aur.archlinux.org/packages/fry/) or [fry-git](https://aur.archlinux.org/packages/fry-git/).
To install, use your favorite AUR helper (`yaourt`, `aura`, etc.).

```sh
$ yaourt -S fry
```

### Rubies

By default `fry` will look for rubies in `~/.rubies`. This can be configured as you like.

#### Install (with ruby-install or ruby-build)
If you have [ruby-install](https://github.com/postmodern/ruby-install) or
[ruby-build](https://github.com/sstephenson/ruby-build) installed, `fry` provides a wrapper
with autocompletion and building to the correct destination.
To install rubies this way, run the following command:

```sh
# To see available rubies
fry install
# To install a specific ruby version
fry install jruby-1.7.9
```

## Configuration

To see which configuration options are available and your current configuration,
you can execute the command `fry config`.

### Path (Rubies)

This option determines where `fry` looks for rubies.

```sh
# To see the path
fry config path
# To set the path
fry config path /opt/rubies
```

### Auto-Switch

If you want `fry` to look for a [.ruby-version](https://gist.github.com/fnichol/1912050) file and
automatically switch ruby on directory change then you can enable auto-switching. This is off by default.

```sh
# To see the auto-switch status
fry config auto
# To enable auto-switch
fry config auto on
# To disable auto-switch
fry config auto off
```

#### Pow

When you have a .ruby-version file in your home directory this will be used by pow as default.
If you want it to pickup the custom ruby-version per project you have to create a `.powenv` inside
the project folder with the following content:
```sh
export PATH="$(fish -c 'fry current --path'):$PATH"
```

### Default Ruby

If you wish to set a default Ruby, simply call `fry` in `~/.config/fish/config.fish`:
```sh
fry ruby-1.9
```

If you have enabled auto-switching, simply create a `.ruby-version` file in your home directory:
```sh
echo 'ruby-1.9' > ~/.ruby-version
```

## Examples

List available rubies:
```sh
fry
  system
* 1.9.3-p392
  2.0.0-p0
  jruby-1.7.3
```

Install ruby:
```sh
fry install <tab>
fry install 2.0.0-p247
fry use 2.0.0-p247
```

Get help:
```sh
fry help
```
