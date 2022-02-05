# Dotfiles

My dotfiles, managed by `stow`. The folder `minimal_vim/` contains a stripped
down `.vimrc` with only the basic mappings and settings

## GNU stow

Dotfile symlinking is managed with GNU stow.
In order to install a "package" (bundle of config files), e.g. vim:

```bash
stow --dir=stow/ --target=/home/user vim
```

Stow only creates relative symlinks. Uninstall a package with `-D` like this:

```bash
stow -D --dir=stow/ --target=/home/user vim
```

To install or remove *all* packages and link this dir to ~/.dotfiles, run:
```bash
make install # install all dotfiles
make remove # remove all dotfiles
```

## Additional tools

The file `./packages` contains most of the tools used in this repo, it's up to the
user to install and configure them properly.
