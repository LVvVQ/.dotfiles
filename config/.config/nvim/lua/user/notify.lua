local notify = require("notify")
local dap = require("dap")

vim.notify = notify

notify.setup({
  level = 2,
  render = "compact",
  stages = "fade_in_slide_out",
  timeout = 2500,
  background_colour = "#000000",
  opacity = 0.8,
  position = "top_right",
  minimum_width = 30,
  max_width = 45,
  max_height = 5,
  fps = 120,
})
