-- ui
vim.opt.number = true
vim.opt.laststatus = 3   -- show only a global status line for the current window, useful to remove the status lines from nvim-dap-ui plugin
vim.opt.winbar = ""      -- disables names for all windows
vim.o.wrap = false       -- no line wrapping
--

vim.opt.clipboard = "unnamedplus" -- shares system clipboard

-- indentation
vim.opt.expandtab = true   -- Transform tabs into spaces.
vim.opt.shiftwidth = 2     -- Indentation size used by the '=' command.
vim.opt.tabstop = 2        -- Visualization of a real Tab character
vim.opt.softtabstop = 2    -- Tab/Backspace behavior in insert mode
--
