return {

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "folke/neodev.nvim",
        opts = { experimental = { pathStrict = true } }
      },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "hrsh7th/cmp-nvim-lsp" },
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
    },
    config = function(_, opts)
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
      vim.diagnostic.config(opts.diagnostics)
    end
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      local lspconfig = require("lspconfig")

      local on_attach = function(client, bufnr)
        local function buf_set_option(...)
          vim.api.nvim_buf_set_option(bufnr, ...)
        end

        buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-b>", ":lua vim.diagnostic.open_float()<CR>", opts)
        vim.keymap.set('n', 'gH', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gd', "<cmd>Lspsaga peek_definition<CR>", opts)
        vim.keymap.set('n', 'gh', "<cmd>Lspsaga hover_doc<CR>", opts)
        vim.keymap.set('n', '<space>rn', "<cmd>Lspsaga rename<CR>", opts)
        vim.keymap.set('n', '<space>ol', "<cmd>Lspsaga outline<CR>", opts)
        vim.keymap.set('n', '<space>fm', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end

      require("mason").setup({
      })

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
          "jdtls",
          "tailwindcss",
          "yamlls"
        }
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

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
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
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

      require("lspconfig")["tailwindcss"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },

  {
    "github/copilot.vim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-s>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "MunifTanjim/prettier.nvim"
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.autopep8,
          null_ls.builtins.formatting.xmlformat,
        },
      })
    end
  },

  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = function()
      require("lspsaga").setup({
        ui = {
          title = true,
          -- Border type can be single, double, rounded, solid, shadow.
          border = "rounded",
          winblend = 0,
          expand = "",
          collapse = "",
          code_action = "💡",
          incoming = " ",
          outgoing = " ",
          hover = ' ',
          kind = {},
        },
      })
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    config = function()
      require "lsp_signature".setup({
        hint_prefix = "🔥 ",
        transparency = nil,
        shadow_blend = 36,
        shadow_guibg = 'Black',
      })
    end
  }

}
