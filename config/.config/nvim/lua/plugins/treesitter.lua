return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "mrjones2014/nvim-ts-rainbow",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "romgrk/nvim-treesitter-context",
    },
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "cpp", "java", "go", "python", "html", "css", "javascript", "typescript", "vue", "sql",
          "lua", "json", "yaml", "vim", "vimdoc", "markdown", "markdown_inline" },
        sync_install = true,
        auto_install = true,
        indent = { enable = true },
        context_commentstring = { enable = true, enable_autocmd = false },
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        keys = {
          { "<C-s>", desc = "Increment selection" },
          { "<bs>",  mode = "x",                  desc = "Decrement selection" },
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-s>",
            node_incremental = "<C-s>",
            scope_incremental = "<nop>",
            node_decremental = "<bs>",
          },
        },
        --[[ rainbow = { ]]
        --[[   enable = true, ]]
        --[[   query = 'rainbow-parens', ]]
        --[[ }, ]]
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['ap'] = '@parameter.outer',
              ['ip'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']c'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']C'] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[c'] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[C'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
      }
    end
  }
}
