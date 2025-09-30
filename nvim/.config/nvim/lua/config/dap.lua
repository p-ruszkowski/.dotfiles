local dap = require("dap")

local function get_test_function_name()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  for i = row, 1, -1 do
    local line = vim.fn.getline(i)
    local func_name = line:match("^%s*def%s+(test[%w_]+)")
    if func_name then
      return func_name
    end
  end
  return nil
end


dap.adapters.python = {
  type = 'executable';
  command = 'python';
  args = { '-m', 'debugpy.adapter' };
}
dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
  },
  {
    name= "Pytest: Current File",
    type= "python",
    request= "launch",
    module= "pytest",
    args= {
        "${file}",
        "-sv",
        "--log-cli-level=INFO",
        "--log-file=test_out.log",
    },
    console= "integratedTerminal",
  },
  {
    name = "Pytest: Function Under Cursor",
    type = "python",
    request = "launch",
    module = "pytest",
    args = function()
      local func = get_test_function_name()
         if not func then
          error("No test function found above the cursor.")
        end
        return { "${file}::" .. func, "-sv", "--log-cli-level=INFO", "--log-file=test_out.log" }
      end,
    console = "integratedTerminal",
  },
}

dap.set_log_level("TRACE")

