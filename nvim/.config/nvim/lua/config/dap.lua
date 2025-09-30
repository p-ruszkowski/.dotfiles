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

local function terminate_and_select_config()
  -- End session if exists 
  if dap.session() then
    dap.terminate()
    -- Sleep
    vim.defer_fn(terminate_and_select_config, 300)
    return
  end

  -- Get configs
  local ft = vim.bo.filetype
  local configs = dap.configurations[ft]

  if not configs or vim.tbl_isempty(configs) then
    vim.notify("No DAP configuration for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  -- Select configuration
  vim.ui.select(configs, {
    prompt = "DAP Configuration:",
    format_item = function(item)
      return item.name
    end,
  }, function(choice)
    if choice then
      dap.run(choice)
    else
      vim.notify("Canceled by user", vim.log.levels.INFO)
    end
  end)
end

vim.keymap.set("n", "<leader>ds", terminate_and_select_config, {
  desc = "DAP: Terminate and select config (like :DapNew)"
})

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
    args = function()
      -- Prompt for extra args
      local input = vim.fn.input("Extra pytest args: ")
      local extra_args = {}
      for arg in string.gmatch(input, "%S+") do
        table.insert(extra_args, arg)
      end

      -- Final args: test target + common flags + user input
      local args = {
        "${file}",
        "-sv",
        "--log-cli-level=DEBUG",
        "--log-file=test_out.log",
      }

      -- Append user-supplied args
      vim.list_extend(args, extra_args)

      return args
    end,
    console= "integratedTerminal",
  },
  {
    name = "Pytest: Function Under Cursor",
    type = "python",
    request = "launch",
    module = "pytest",
    args = function()
      -- Get the function name under cursor
      local func = get_test_function_name()
      if not func then
        error("No test function found above the cursor.")
      end

      -- Prompt for extra args
      local input = vim.fn.input("Extra pytest args: ")
      local extra_args = {}
      for arg in string.gmatch(input, "%S+") do
        table.insert(extra_args, arg)
      end

      -- Final args: test target + common flags + user input
      local args = {
        "${file}::" .. func,
        "-sv",
        "--log-cli-level=DEBUG",
        "--log-file=test_out.log",
      }

      -- Append user-supplied args
      vim.list_extend(args, extra_args)

      return args
    end,
    console = "integratedTerminal",
  },

}

dap.set_log_level("TRACE")

