local status_ok, dapui = pcall(require, 'dapui')
if not status_ok then
  vim.notify("dapui not found")
  return
end

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "o", "<2-LeftMouse>", "<CR>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        'scopes',
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 30,
      position = 'left',
    },
    {
      elements = {
        'console',
      },
      size = 15,
      position = 'bottom',
    },
    {
      elements = {
        'repl',
      },
      size = 30,
      position = 'right',
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})
