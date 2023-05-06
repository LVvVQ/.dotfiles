# <center> .dotfiles</center>

## Introduction
`.dotfiles` is mainly used to store my configuration files. I can sync these configuration files between different devices by Git.

After I clone this repository, I can use `stow`(A manage tool, you can use package manager to install it) to link the configuration files to the corresponding directories.

## Dependices
- [Hack Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)
- rg
- fd
- stow
- FZF
- Lazygit

## Components
- neovim    (Text editor)
- ranger    (Terminal file manager)
- fish      (Shell)
- polybar   (status bar)
- dwm       (Windows manager)
- st        (Simple terminal)
- dmenu     (Quick start menu)
- rofi      (A window switcher, application launcher and dmenu replacement)
- dunst     (Customizable and lightweight notification-daemon)
- viewnior  (A simple, fast and elegant image viewer program)

## Usage
Automatically initialize and update every submodule in the repository.
``` shell
git clone https://github.com/LVvVQ/.dotfiles
```
------

### neovim
> Install Plugins

I use [lazy.nvim](https://github.com/folke/lazy.nvim) to manage plugins, so when you open Neovim for the first time, Neovim will automatically download lazy.nvim, and automatically download the plugins after successful download. 

After the plugins are downloaded successfully, you should see Tressitter start downloading Language Parsers, or you can use the `:TSInstallSync` command to install them manually.

After that, when you type the command `:Mason`, [Mason](https://github.com/williamboman/mason.nvim) will start downloading Language Server automatically.

And if everything goes well, you should have a brand new Neovim when you close and open Neovim again.

------

### ranger
> Install ranger_devicons plug

You need to download the [devicons](https://github.com/alexanderjeurissen/ranger_devicons) and [zoxide](https://github.com/jchook/ranger-zoxide) into `~/.config/ranger/plugins/`:
```shell
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
git clone https://github.com/jchook/ranger-zoxide ~/.config/ranger/plugins/zoxide
```

------

### dwm && st && dmenu
You need to enter the directory corresponding to the three of `dwm`, `st` and `dmenu` to execute the command:

```shell
sudo make clean install
```

NOTE: If `make` fails, you may need to install some dependencies lib.

-----

### mpd
Start the mpd service in user mode

``` shell
systemctl --user enable --now mpd.service
```

## Stow
After you have done the above configuration, if there is no problem, you can use `stow` to link the configuration to the corresponding directory.

``` shell
cd .dotfiles
stow -vnt ~ config/
```

The above command uses the -n flag to simulate how the contents of the `config` directory will be linked next. 

For example: `~/.config/nvim` --> `~/config/.config/nvim`

If you are sure that the linking is ok, you can use the following command to do the real linking

``` shell
stow -vt ~ config/
```

You can use following command to unlink:
``` shell
stow -vDt ~ *
```

For specific usage of `stow`, please check `man stow`.

## 😄HAPPY ENDING😆
