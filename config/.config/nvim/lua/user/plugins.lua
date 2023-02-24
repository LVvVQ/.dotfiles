local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerInstall
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins
  use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter
  use 'tpope/vim-surround'
  use 'mg979/vim-visual-multi'
  use 'kdheepak/lazygit.vim'
  use 'lambdalisue/suda.vim'
  use 'lunarvim/colorschemes'
  use 'sainnhe/sonokai'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'tpope/vim-fugitive'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'lewis6991/impatient.nvim'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-repeat'
  use 'nathom/filetype.nvim'
  use 'sindrets/diffview.nvim'
  use 'folke/todo-comments.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'ray-x/lsp_signature.nvim'
  use 'voldikss/vim-translator'
  use 'sindrets/winshift.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'tpope/vim-speeddating'
  use 'folke/trouble.nvim'
  use { 'AckslD/nvim-neoclip.lua', requires = { 'tami5/sqlite.lua', module = 'sqlite' }, }
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown", cmd = 'MarkdownPreview' }, })
  use { 'phaazon/hop.nvim', branch = 'v1', }
  use { 'goolord/alpha-nvim', config = function() require 'alpha'.setup(require 'alpha.themes.dashboard'.config) end }

  -- cmp plugins
  use 'hrsh7th/nvim-cmp' -- The completion plugin
  use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  use 'hrsh7th/cmp-cmdline' -- cmdline completions
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'

  -- snippets --
  use 'L3MON4D3/LuaSnip' --snippet engine
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

  -- LSP --
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig' -- enable LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
  use "tami5/lspsaga.nvim"

  -- Telescope --
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'nvim-telescope/telescope-live-grep-raw.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', }

  -- Treesitter --
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', }
  use 'p00f/nvim-ts-rainbow'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'romgrk/nvim-treesitter-context'

  -- Git --
  use 'lewis6991/gitsigns.nvim'

  -- Terminal --
  use { 'akinsho/toggleterm.nvim' }

  -- Debugger --
  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'rcarriga/nvim-dap-ui'
  use 'ravenxrz/DAPInstall.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
