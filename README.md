# About

My latest and greatest emacs config based heavily on http://crypt.codemancers.com/posts/2013-09-26-setting-up-emacs-as-development-environment-on-osx/

Since my 9-5 is all Ruby/Rails, this config is very much geared toward that.

# Install Config

## On OS X

- Clone this repo into `~/.emacs.d`
- Install [Homebrew](http://brew.sh/)
- Install emacs: `brew install emacs --use-git-head --cocoa --srgb`
- Install necessary external binaries: `brew install emacs ispell cask rbenv git editorconfig ruby-build`
- Navigate into `~/.emacs.d` and run: `cask install`
- Start emacs!

## Other Operating Systems

- Clone this repo into `~/.emacs.d`
- Install [Cask](http://cask.readthedocs.org/en/latest/guide/installation.html)
- Install [EditorConfig](https://github.com/editorconfig/editorconfig-core-c/blob/master/INSTALL.md)
- Install [rbenv](https://github.com/sstephenson/rbenv#installation)
- Navigate into `~/.emacs.d` and run: `cask install`
- Start emacs!
