local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server.name == "jsonls" then
    local jsonls_opts = require("user.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("user.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts = require("user.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server.name == "clangd" then
    local clangd_opts = require("user.lsp.settings.clangd")
    opts = vim.tbl_deep_extend("force", clangd_opts, opts)
  end

  if server.name == "asm_lsp" then
    local asm_lsp_opts = require("user.lsp.settings.asm_lsp")
    opts = vim.tbl_deep_extend("force", asm_lsp_opts, opts)
  end

  if server.name == "bashls" then
    local bashls_opts = require("user.lsp.settings.bashls")
    opts = vim.tbl_deep_extend("force", bashls_opts, opts)
  end

  if server.name == "emmet_ls" then
    local emmet_ls_opts = require("user.lsp.settings.emmet_ls")
    opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  end

  if server.name == "cssls" then
    local cssls_opts = require("user.lsp.settings.cssls")
    opts = vim.tbl_deep_extend("force", cssls_opts, opts)
  end

  if server.name == "volar" then
    local volar_opts = require("user.lsp.settings.volar")
    opts = vim.tbl_deep_extend("force", volar_opts, opts)
  end

  if server.name == "vuels" then
    local vuels_opts = require("user.lsp.settings.vuels")
    opts = vim.tbl_deep_extend("force", vuels_opts, opts)
  end

  if server.name == "eslint" then
    local eslint_opts = require("user.lsp.settings.eslint")
    opts = vim.tbl_deep_extend("force", eslint_opts, opts)
  end

  if server.name == "tsserver" then
    local tsserver_opts = require("user.lsp.settings.tsserver")
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server.name == "gopls" then
    local gopls_opts = require("user.lsp.settings.gopls")
    opts = vim.tbl_deep_extend("force", gopls_opts, opts)
  end

  if server.name == "golangci_lint_ls" then
    local golangci_lint_ls_opts = require("user.lsp.settings.golangci_lint_ls")
    opts = vim.tbl_deep_extend("force", golangci_lint_ls_opts, opts)
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
