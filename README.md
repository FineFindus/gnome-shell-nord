## Nord Gnome Shell Fork

This is a fork of the Gnome Shell desktop environment that applies the Nord theme. Nord is an arctic, north-bluish color palette that is known for its pleasing aesthetics and calming effect.

![Preview of the desktop](https://user-images.githubusercontent.com/63370021/236697147-097cdba4-b501-4d5e-9d3d-bf04a8fbcc7e.png)


### Installation
While it would be possible to compile and install the whole shell, it is only necessary to compile the CSS code for it. This requires the sass compiler to be installed.

1. Clone the `data/theme` directory to your local machine.
2. Run the compiler to compile the Sass code to a single CSS file
```sh
sassc -M  data/theme/gnome-shell.scss gnome-shell.css
```
3. Create a new shell theme in in your themes directory (e.g. `~/.themes`) with a `gnome-shell` and a `gnome-shell/assets` directory
4. Move the `svg` files into the asset dierectory and the `gnome-shell.css` into `gnome-shell`.
5. Apply the theme via Tweaks.

## License
GNOME Shell is distributed under the terms of the GNU General Public License,
version 2 or later. See the [COPYING][license] file for details.

[project-wiki]: https://wiki.gnome.org/Projects/GnomeShell
[bug-tracker]: https://gitlab.gnome.org/GNOME/gnome-shell/issues
[schedule]: https://wiki.gnome.org/Schedule
[license]: COPYING
