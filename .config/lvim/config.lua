local dap = require("dap")

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}
local cCPPConfigs = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    stopAtBeginningOfMainSubprogram = true,
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
    args = function()
      local input = vim.fn.input('Program arguments: ')
      return vim.fn.split(input, " ", true)
    end,
  },
  {
    name = "Select and attach to process",
    type = "gdb",
    request = "attach",
    stopAtBeginningOfMainSubprogram = true,
    -- program = function()
    --    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    -- end,
    -- pid = require('dap.utils').pick_process,
    -- pid = function()
    --    local name = vim.fn.input('Executable name (filter): ')
    --    return require("dap.utils").pick_process({ filter = name })
    -- end,
    pid = function()
       return tonumber(vim.fn.input('Pid: '))
    end,
    cwd = '${workspaceFolder}',
    console = "integratedTerminal",
  },
}
dap.configurations.c = cCPPConfigs;
dap.configurations.cpp = cCPPConfigs;

------------------------------------------------------------------------------------
-- vscode-js-debug
-- A DAP-compatible JavaScript debugger.

-- vscode-js-debug contains 2 executables:

--     dapDebugServer.js (recommended) available since v1.77.0. All examples below that use dapDebugServer require you to use this executable.
--     vsDebugServer.js vscode specific (to make it work with nvim-dap you can use use nvim-dap-vscode-js but the above variant is recommended)

-- A Manual setup using the dapDebugServer executable looks like this:

--     Make sure you're using nvim-dap 0.6.0+

--     Install vscode-js-debug (https://github.com/microsoft/vscode-js-debug):
--         Download js-debug-dap-${version}.tar.gz from their releases page. You need at least version 1.77.0 (it might be not available yet in newer versions)
--         Extract it to some folder via tar xvzf path/to/vscode-js-debug.tar.gz.
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {vim.fn.expand("~") .. "/js-debug/src/dapDebugServer.js", "${port}"},
  }
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'pwa-node',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = vim.fn.getcwd(),
    stopOnEntry = true,
    console = "integratedTerminal"
  },
}
dap.configurations.typescript = {
  {
    name = 'Launch',
    type = 'pwa-node',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/dist/', 'file')
    end,
    cwd = vim.fn.getcwd(),
    stopOnEntry = true,
    sourceMaps = true,
    outFiles = { "${workspaceFolder}/dist/**/*.js", "!**/node_modules/**" },
    console = "integratedTerminal"
  },
}
------------------------------------------------------------------------------------

local function get_python()
  local cwd = vim.fn.getcwd()
  if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
    return cwd .. '/venv/bin/python'
  elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
    return cwd .. '/.venv/bin/python'
  else
    return 'python3'
  end
end
dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      command = get_python(),
      args = { '-Xfrozen_modules=off', '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    -- pythonPath = "python3";
    console = "integratedTerminal";
    stopOnEntry = true;
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python3'
      end
    end;
  },
}

lvim.builtin.which_key.mappings["d"]["h"] = {
  function() require("dap.ui.widgets").hover() end,
  "Hover All Variables",
}

lvim.builtin.which_key.mappings["d"]["H"] = {
  function() local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes) end,
  "Hover Variable",
}

lvim.transparent_window = true
