# <center> .dotfiles</center>

## Introduction
`.dotfiles` is mainly used to store my configuration files. I can sync these configuration files between different devices by Git.

After I clone this repository, I can use `stow`(A manage tool, you can use package manager to install it) to link the configuration files to the corresponding directories.

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

Use `nvim` to open `.dotfiles/config/.config/nvim/lua/user/plugins.lua` file, and then execute `:PackerSync` to install plugins.

> Install LSP server

Then use `:LspInstall` or `:LspInstallInfo` (nvim commands) to install the language service protocol you need.

> Install debug adapter

Use `:DIInstall` (nvim command) to install the debug adapter you need. The debug adapter debugging for `dap` plugin.

After downloading the debug adapter, you also need to **create configuration file** for the corresponding language in the `nvim/lua/user/dap` directory, and update the `config_debugger()` function of the `nvim/lua/user/dap/config.lua` file at the same time.

NOTE: If you fail to download debug adapter by `:DIInstall`, you can go to [nvim-dap](https://github.com/mfussenegger/nvim-dap) and check the [Debug Adapter installation wiki](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation) to download debug adapter manually.The default download path of `:DIInstall` is `~/.local/share/nvim/dapinstall`.

------

### ranger
> Install ranger_devicons plug

You need to download the [devicons plugin](https://github.com/alexanderjeurissen/ranger_devicons) into `~/.config/ranger/plugins/ranger_devicons`:
```shell
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
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

## Extra tools
- rg
- fd
- stow
- FZF
- Lazygit

## 😄HAPPY ENDING😆
