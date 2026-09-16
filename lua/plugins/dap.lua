return {
  "mfussenegger/nvim-dap",
  keys = {
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },

    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },

    {
      "<leader>dC",
      function()
        require("dap").run_to_cursor()
      end,
      desc = "Run to Cursor",
    },

    {
      "<leader>dT",
      function()
        require("dap").terminate()
      end,
      desc = "Terminate",
    },
  },
  config = function()
    local dap = require("dap")
    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
    }
    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        args = {}, -- provide arguments if needed
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = true,
      },
      {
        name = "Select and attach to process",
        type = "gdb",
        request = "attach",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        pid = function()
          local name = vim.fn.input("Executable name (filter): ")
          return require("dap.utils").pick_process({ filter = name })
        end,
        cwd = "${workspaceFolder}",
      },
      {
        name = "Attach to gdbserver :1234",
        type = "gdb",
        request = "attach",
        target = "localhost:1234",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
      },
    }
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.python = {
      -- The first three options are required by nvim-dap
      type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
      request = "launch",
      name = "Launch file",

      -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

      program = "${file}", -- This configuration will launch the current file if used.
      pythonPath = function()
        -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
        -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
        -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
          return cwd .. "/venv/bin/python"
        elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
          return cwd .. "/.venv/bin/python"
        else
          return "/usr/bin/python"
        end
      end,
    }
  end,
}
