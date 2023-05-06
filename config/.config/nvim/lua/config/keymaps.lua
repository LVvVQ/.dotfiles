local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
keymap({ "n", "v" }, "J", "5j", opts)
keymap({ "n", "v" }, "K", "5k", opts)
keymap({ "n", "v" }, "H", "^", opts)
keymap({ "n", "v" }, "L", "$", opts)

keymap("n", "S", ":w<CR>", opts)
keymap("n", "Q", ":q<CR>", opts)
keymap("n", "W", "5w", opts)
keymap("n", "B", "5b", opts)
keymap("n", "dL", "d$", opts)
keymap("n", "yL", "y$", opts)

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

keymap("n", "<leader>/", "<cmd>nohl<CR>", opts)
keymap("n", "<leader>n", "<Esc>/<++><CR>:nohl<CR>c4l", opts)

-- Insert --

keymap("i", "<C-j>", "<down>", opts)
keymap("i", "<C-k>", "<up>", opts)
keymap("i", "<C-h>", "<left>", opts)
keymap("i", "<C-l>", "<right>", opts)
keymap("i", "<C-v>", [[<Esc>"+p]], opts)

-- Visual --
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
