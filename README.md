# fry

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

### Rubies

By default `fry` will look for rubies in `~/.rubies`. This can be configured as you like.

#### ruby-build
If you have [ruby-build](https://github.com/sstephenson/ruby-build) installed, `fry` provides a wrapper with autocompletion and building to the correct destination.
To install rubies this way, run the following command:

```sh
fry install 1.9.3-p392
```


## Configuration

### Rubies

If you want to change where `fry` looks for rubies. You simply set a universal variable:

```sh
set -U fry_rubies /opt/rubies
```

### Auto-Switching

If you want `fry` to look for a [.ruby-version](https://gist.github.com/fnichol/1912050) file and automatically switch ruby on directory change then you can enable auto-switching.
This is done by setting a universal variable:

```sh
set -U fry_auto_switch 1
```

This is off by default, so you can either do `set -e fry_auto_switch` or `set -U fry_auto_switch 0` to turn this off again.

#### Pow

When you have a .ruby-version file in your home directory this will be used by pow as default.
If you want it to pickup the custom ruby-version per project you have to create a `.powenv` inside the project folder with the following content:
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
