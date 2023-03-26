local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)

keymap("n", "S", ":w<CR>", opts)
keymap("n", "Q", ":q<CR>", opts)
keymap("n", "W", "5w", opts)
keymap("n", "B", "5b", opts)
keymap("n", "dL", "d$", opts)
keymap("n", "yL", "y$", opts)

--keymap("n", "<C-j>", ":set splitbelow<CR>:sp<CR>", opts)
--keymap("n", "<C-k>", ":set nosplitbelow<CR>:sp<CR>", opts)
--keymap("n", "<C-h>", ":set nosplitright<CR>:vsp<CR>", opts)
--keymap("n", "<C-l>", ":set splitright<CR>:vsp<CR>", opts)

keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>sh", "<C-w>t<C-w>K", opts)
keymap("n", "<leader>sv", "<C-w>t<C-w>H", opts)

keymap("n", "<up>", ":res +5<CR>", opts)
keymap("n", "<down>", ":res -5<CR>", opts)
keymap("n", "<left>", ":vertical resize-5<CR>", opts)
keymap("n", "<right>", ":vertical resize+5<CR>", opts)

keymap("n", "tu", "<cmd>tabe<CR>", opts)
keymap("n", "th", "<cmd>bNext<CR>", opts)
keymap("n", "tl", "<cmd>bnext<CR>", opts)
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", opts)

keymap("n", [[==]], "<cmd>Format<CR>", opts)
keymap("n", "<leader>/", "<cmd>nohl<CR>", opts)
keymap("n", "<leader>n", "<Esc>/<++><CR>:nohl<CR>c4l", opts)

-- Insert --

keymap("i", "<C-j>", "<down>", opts)
keymap("i", "<C-k>", "<up>", opts)
keymap("i", "<C-h>", "<left>", opts)
keymap("i", "<C-l>", "<right>", opts)
keymap("i", "<C-v>", [[<Esc>"+p]], opts)

-- Visual --

keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)
keymap("v", "J", "5j", opts)
keymap("v", "K", "5k", opts)

keymap("v", "d", [["+d]], opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<C-j>", ":m .+1<CR>==", opts)
keymap("v", "<C-k>", ":m .-2<CR>==", opts)

-- Visual Block --

-- Move text up and down
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)

-- LazyGit --
keymap("n", "<C-g>", "<cmd>LazyGit<CR>", opts)

-- telescope --
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>frg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_raw()<CR>", opts)
keymap("n", "<leader>fm", "<cmd>Telescope media_files<CR>", opts)
keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)

-- Nvimtree --
keymap("n", "tt", ":NvimTreeToggle<cr>", opts)

-- Debugger --
keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<F6>", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F7>", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F8>", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<F9>", ":lua require'dap'.terminate()<cr>", opts)
keymap("n", "<leader>bb", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>cb", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<leader>dl", ":lua require'dap'.run_last()<CR>", opts)
keymap("n", "T", "<cmd>lua require'dapui'.eval()<cr>", opts)

-- hop --
keymap('n', 's', "<cmd>HopChar1<cr>", {})
keymap('v', 's', "<cmd>HopChar1<cr>", {})
keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})

-- translator --
keymap("n", "ts", "<cmd>Translate zh-CN<CR>", opts)
keymap("x", "ts", "<cmd>Translate zh-CN<CR>", opts)

-- winshift --
keymap("n", "<C-W>m", ":WinShift<cr>", opts)

-- symbols-outline --
keymap("n", "<leader>sy", "<cmd>SymbolsOutline<CR>", opts)

-- trouble --
keymap("n", "<leader><leader>t", "<cmd>TroubleToggle<CR>", opts)
keymap("n", "gd", "<cmd>Trouble lsp_definitions<CR>", opts)
keymap("n", "gi", "<cmd>Trouble lsp_implementations<CR>", opts)
keymap("n", "gr", "<cmd>Trouble lsp_references<CR>", opts)

keymap("n", "<leader>oi", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
keymap("n", "crv", "<Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
keymap("n", "crc", "<Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
keymap("n", "crm", "<Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "E", ":lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<leader>rn", ":lua vim.lsp.util.rename()<CR>", opts)
keymap("n", "<leader>ac", ":lua vim.lsp.buf.code_action()<CR>", opts)
keymap("i", "<C-b>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<C-b>", ":lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "[[", ":lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "]]", ":lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "<leader>q", ":lua vim.diagnostic.setloclist()<CR>", opts)
keymap("n", "==", ":lua vim.lsp.buf.format {async = true }<CR>", opts)
