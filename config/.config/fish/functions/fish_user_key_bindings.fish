function fish_user_key_bindings
  fish_vi_key_bindings

  bind -s --preset -M default H beginning-of-line
  bind -s --preset -M default L end-of-line

  bind -s --preset -M visual H beginning-of-line
  bind -s --preset -M visual L end-of-line

  bind -s --preset dH backward-kill-line
  bind -s --preset dL kill-line
end
