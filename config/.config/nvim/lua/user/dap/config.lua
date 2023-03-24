local M = {}

local function config_sign()
  local dap = require "dap"
  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "", })
  vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "LspDiagnosticsSignHint", linehl = "", numhl = "", })
  vim.fn.sign_define("DapStopped", { text = "", texthl = "LspDiagnosticsSignInformation", linehl = "DiagnosticUnderlineInfo", numhl = "LspDiagnosticsSignInformation", })
end

local function config_dapui()
  -- dapui config
  local dap, dapui = require "dap", require "dapui"
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
    vim.api.nvim_command("DapVirtualTextEnable")
    -- dapui.close("tray")
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    vim.api.nvim_command("DapVirtualTextDisable")
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    vim.api.nvim_command("DapVirtualTextDisable")
    dapui.close()
  end
  -- for some debug adapter, terminate or exit events will no fire, use disconnect reuest instead
  dap.listeners.before.disconnect["dapui_config"] = function()
    vim.api.nvim_command("DapVirtualTextDisable")
    dapui.close()
  end

end

local function config_debuggers()
  local dap = require "dap"
  -- TODO: wait dap-ui for fixing temrinal layout
  -- the "30" of "30vsplit: doesn't work
  dap.defaults.fallback.terminal_win_cmd = '30 vsp new' -- this will be overrided by dapui
  dap.set_log_level("DEBUG")

  -- config per launage
  require("user.dap.vsc-cpp")
  require("user.dap.debugpy")
  require("user.dap.vscode-go")
  require("user.dap.java-debug-adapter")

end

function M.setup()
  config_sign()
  config_debuggers()
  config_dapui()
end

return M
