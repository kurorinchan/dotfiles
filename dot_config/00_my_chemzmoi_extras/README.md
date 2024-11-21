# Managing

All contents under this directory, including this file, is managed by chezmoi. So use `chezmoi`
command to manage any files.

## Naming

Create the directory with the name of the software e.g. `firefox`.

## READMEs

Make sure to put a README in each software directory.

# What is this?

This directory contains any files that are "hard to sync" with `chezmoi` and may require extra
work (either manual or scripts).

For example, firefox (and its derived browsers) use randomly generated strings for naming its
profile directories. These cannot be simply synced by a hardcoded path. So stuff
like `userChrome.css` and files imported by it could be in this directory.

## Some files look like they should be under $HOME/.local/share

True. But *I* probaly look at `.config` first before recalling that `.local/share` even exist.

## Why the weird directory name?

Because `00` would usually show up as the first entry in `ls`. Also most software don't start with
a number so it's likely this stands out *for me*. Also with words like `my` it's easier to
notice that I created this, instead of a random software that snuck into my system.
