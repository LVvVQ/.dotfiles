vim.cmd([[

  augroup _general_settings
      autocmd!
      autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
      autocmd InsertLeave * :silent !fcitx5-remote -c
      autocmd BufCreate *  :silent !fcitx5-remote -c
      autocmd BufEnter *  :silent !fcitx5-remote -c
      autocmd BufLeave *  :silent !fcitx5-remote -c
      autocmd VimEnter * highlight Visual guibg=#4e4e4e
      autocmd TextYankPost * silent! lua vim.highlight.on_yank()
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

]])
