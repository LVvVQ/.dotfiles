return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "tt", "<cmd>NeoTreeRevealToggle<cr>", desc = "NeoTree" },
  },
  config = function()
    require("neo-tree").setup {
      close_if_last_window = true,
      window = {
        position = "left",
        width = 30,
        filesystem = {
          bind_to_cwd = false,
          follow_current_file = true,
        },
        mappings = {
          ["o"] = "open_tabnew",
          ["t"] = "none"
        }
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    }
  end,
}
