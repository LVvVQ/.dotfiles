require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "bashls",
    "cssls",
    "emmet_ls",
    "eslint",
    "golangci_lint_ls",
    "gopls",
    "jsonls",
    "lua_ls",
    "pyright",
    "stylelint_lsp",
    "tsserver",
    "volar",
  },
})
