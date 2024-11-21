This directory contains settings for floorp.

# Directories

## `profile`
Because floorp is a firefox based browser, user profiles are put under randomly generated
directory name.

This directory contains files for profiles.

### `profile/userchrome`

This directory contains files for userchrome, i.e. customizing browser UI.

First, navigate to `about:config` in the browser. Then make sure to enable `toolkit.legacyUserProfileCustomizations.stylesheets`

Go to the current Floorp profile directory and remove `chrome` directory. Then run the following
command, to create a symlink to use userchrome CSSs in this directory.

```bash
ln -s ~/.config/00_my_chemzmoi_extras/floorp/profile/userchrome/chrome .
```
