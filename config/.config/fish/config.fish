if status is-interactive
  # Commands to run in interactive sessions can go here

  #NOTE: See detail https://github.com/sebastiencs/icons-in-terminal
  #source ~/.local/share/icons-in-terminal/icons.fish

  # Emulates vim's cursor shape behavior
  # Set the normal and visual mode cursors to a block
  set fish_cursor_default block blink
  # Set the insert mode cursor to a line
  set fish_cursor_insert line blink
  # Set the replace mode cursor to an underscore
  set fish_cursor_replace_one underscore blink
  # The following variable can be used to configure cursor shape in
  # visual mode, but due to fish_cursor_default, is redundant here
  set fish_cursor_visual block blink

  # alias
  alias vim="nvim"
  alias s="neofetch"
  alias lg="lazygit"
  alias ld="lazydocker"
  alias sudo="sudo -E"
  alias ra="ranger"
  alias setproxy="set -gx ALL_PROXY http://192.168.1.1:10809"
  alias unsetproxy="set -e ALL_PROXY"

  # Open comment when all terminal need proxy
  # set -gx ALL_PROXY http://127.0.0.1:8889
  set -gx EDITOR "nvim"

  # zoxide
  zoxide init fish | source

  #FZF
  set -gx fzf_fd_opts --hidden --exclude=.git
  set -gx FZF_DEFAULT_OPTS '--layout=reverse
                          --border "sharp" --preview-window "sharp"
                          --color=dark
                          --color=fg:-1,bg:-1,hl:#73d0ff,fg+:-1,bg+:-1,hl+:#ff87d7,border:#af87ff
                          --color=info:#af87ff,prompt:#73d0ff,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
                          --bind ctrl-j:down,ctrl-k:up --preview "bat --color=always --style=numbers --line-range=:500 {} || highlight -O ansi -l {} || cat {} 2> /dev/null | head -500"'

end

# pnpm
set -gx PNPM_HOME "/home/lvvvq/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
