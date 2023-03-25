require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) --> jumps to the definition of the symbol under the cursor
  buf_set_keymap("n", "E", ":lua vim.lsp.buf.hover()<CR>", opts) --> information about the symbol under the cursos in a floating window
  buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts) --> lists all the implementations for the symbol under the cursor in the quickfix window
  buf_set_keymap("n", "<leader>rn", ":lua vim.lsp.util.rename()<CR>", opts) --> renaname old_fname to new_fname
  buf_set_keymap("n", "<leader>ac", ":lua vim.lsp.buf.code_action()<CR>", opts) --> selects a code action available at the current cursor position
  buf_set_keymap("i", "<C-b>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts) --> lists all the references to the symbl under the cursor in the quickfix window
  buf_set_keymap("n", "<C-b>", ":lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "[[", ":lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]]", ":lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<leader>q", ":lua vim.diagnostic.setloclist()<CR>", opts)
  buf_set_keymap("n", "==", ":lua vim.lsp.buf.format {async = true }<CR>", opts) --> formats the current buffer
end

---@diagnostic disable-next-line: undefined-global
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.offsetEncoding = "utf-8"

require("lspconfig")["golangci_lint_ls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["pyright"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["volar"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["cssls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["jsonls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["emmet_ls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["tsserver"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["lua_ls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["bashls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["clangd"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["gopls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["stylelint_lsp"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["yamlls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
require("mason-nvim-dap").setup({
    automatic_setup = true,
})
require 'mason-nvim-dap'.setup_handlers {}
