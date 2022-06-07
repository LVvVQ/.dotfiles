vim.cmd [[

  augroup _general_settings
      autocmd!
      autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
      autocmd InsertLeave * :silent !fcitx5-remote -c
      autocmd BufCreate *  :silent !fcitx5-remote -c
      autocmd BufEnter *  :silent !fcitx5-remote -c
      autocmd BufLeave *  :silent !fcitx5-remote -c
  augroup end

  augroup _nvim-tree
      autocmd!
      autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  augroup end

  augroup _git
      autocmd!
      autocmd FileType gitcommit setlocal wrap
      autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
      autocmd!
      autocmd FileType markdown setlocal wrap
      autocmd FileType markdown setlocal spell
  augroup end

]]
