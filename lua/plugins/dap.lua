local M = {}

M.config = function ()
  local python3_host_prog = vim.fn.substitute(vim.fn.system("which python3"), "\n", "", "g")
  local std2 = require("std2")
  local buf_mapfunc = require("std2").buf_mapfunc

  local status_ok, dap = pcall(require, "dap")
  if not status_ok then
    return
  end

  dap.set_log_level("TRACE")

  dap.defaults.fallback.terminal_win_cmd = "10split new"

  dap.adapters.python = {
    type = "executable",
    command = python3_host_prog,
    args = { "-m", "debugpy.adapter" },
  }

  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      justMyCode = false,
      name = "Launch file",
      program = "${file}",
      pythonPath = function()
        -- python3_host_prog is set in init.nvim
        return python3_host_prog
      end,
    },
  }

end

return M
