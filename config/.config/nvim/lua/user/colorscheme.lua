-- colorscheme --
vim.g.sonokai_style = "andromeda"
vim.g.sonokai_cursor = "blue"
vim.g.sonokai_transparent_background = 1
vim.g.sonokai_better_performance = 1

vim.g.transparent_background = true -- transparent background(Default: false)
vim.g.italic_comments = true -- italic comments(Default: true)
vim.g.italic_keywords = true -- italic keywords(Default: true)
vim.g.italic_functions = false -- italic functions(Default: false)
vim.g.italic_variables = false -- italic variables(Default: false)

vim.g.everforest_transparent_background = 1 -- transparent background(Default: false)
vim.g.everforest_background = 'soft'
vim.g.everforest_better_performance = 1

vim.cmd [[
try
  colorscheme sonokai
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
