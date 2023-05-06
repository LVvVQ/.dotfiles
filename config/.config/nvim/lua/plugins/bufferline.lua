return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
      { "<leader>gb", "<cmd>BufferLinePick<CR>",                 desc = "Pick Buffer" },
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
      { "<leader>bc", "<Cmd>BufferLinePickClose<CR>",            desc = "Pick buffer close" },
    },
    config = function()
      require("bufferline").setup {
        options = {
          separator_style = "thin",
          offsets = {
            {
              filetype = "neo-tree",
              text = "Neo-tree",
              highlight = "Directory",
              text_align = "left",
            },
          }
        }
      }
    end
  }
}
