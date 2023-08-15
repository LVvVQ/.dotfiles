return {
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        render = "compact",
        stages = "fade",
        timeout = 3000,
        background_colour = "#000",
        max_height = function()
          return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
          return math.floor(vim.o.columns * 0.75)
        end,
      })
    end
  },
}
