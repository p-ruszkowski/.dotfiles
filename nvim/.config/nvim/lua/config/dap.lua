local dap = require("dap")

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
}

dap.set_log_level("TRACE")

