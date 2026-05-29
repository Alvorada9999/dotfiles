local map = vim.keymap.set

vim.g.mapleader = ' '

map('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file tree', silent = true })

-- Buffers
map('n', '<leader>c', ':bd<CR>', { desc = 'Close buffer', silent = true })
map('n', '<leader>w', ':w<CR>', { desc = 'Save changes', silent = true })
-- Needs plugin "akinsho/bufferline.nvim"
map('n', '<leader>bj', ':BufferLinePick<CR>', { desc = 'Pick buffer', silent = true })
map('n', '<leader>bn', ':BufferLineCycleNext<CR>', { desc = 'Next buffer', silent = true })
map('n', '<leader>bb', ':BufferLineCyclePrev<CR>', { desc = 'Previous buffer', silent = true })
map('n', '<leader>be', ':BufferLinePickClose<CR>', { desc = 'Pick buffer to close', silent = true })
map('n', '<leader>bh', ':BufferLineCloseLeft<CR>', { desc = 'Close buffers to the left', silent = true })
map('n', '<leader>bl', ':BufferLineCloseRight<CR>', { desc = 'Close buffers to the right', silent = true })
map('n', '<leader>bE', ':BufferLineSortByExtension<CR>', { desc = 'Sort buffers by extension', silent = true })
map('n', '<leader>bD', ':BufferLineSortByDirectory<CR>', { desc = 'Sort buffers by directory', silent = true })
--

-- Quiting
map('n', '<leader>q', ':q<CR>', { desc = 'Leave', silent = true })

-- Comments
-- needs plugin "numToStr/Comment.nvim"
vim.keymap.set("x", "<leader>/", "gc", { desc = 'Toggle comment', remap = true, silent = true })
--

-- Debbuger
-- needs plugin "mfussenegger/nvim-dap"
local dap = require('dap')
vim.keymap.set("n", "<leader>ds", function() dap.continue() end, { desc = 'Start', remap = true, silent = true })
vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = 'Continue', remap = true, silent = true })
vim.keymap.set("n", "<leader>do", function() dap.step_over() end, { desc = 'Step over', remap = true, silent = true })
vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = 'Step into', remap = true, silent = true })
vim.keymap.set("n", "<leader>du", function() dap.step_out() end, { desc = 'Step out', remap = true, silent = true })
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = 'Toggle breakpoint', remap = true, silent = true })
vim.keymap.set("n", "<leader>dd", function() dap.terminate() end, { desc = 'Stop', remap = true, silent = true })
vim.keymap.set("n", "<leader>dp", function() dap.pause() end, { desc = 'Pause', remap = true, silent = true })
-- needs plugin "rcarriga/nvim-dap-ui"
local dapUi = require("dapui")
vim.keymap.set("n", "<leader>dU", function()
  local dap = package.loaded["dap"]

  -- Check if a session is actively running
  local has_session = dap and dap.session() ~= nil

  if has_session then
    -- If a session exists, toggle normally
    dapUi.toggle({ reset = true })
  else
    -- If NO session exists, unconditionally close the UI to clean up the screen
    dapUi.close()
    vim.notify("No active DAP session. Closed DAP UI.", vim.log.levels.INFO)
  end
end, { desc = 'Toggle UI', remap = true, silent = true })
--

-- Terminals
-- needs plugin "akinsho/toggleterm"
require("toggleterm").setup{
	open_mapping = [[<M-3>]]
}
--

-- lsp
local opts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
-- Format (async: true if you want it non-blocking)
vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ async = true })  end, opts)
-- Next diagnostic (error/warning/info/hint)
vim.keymap.set("n", "<leader>lj", function() vim.diagnostic.goto_next({ float = false })  end, opts)
-- Previous diagnostic (error/warning/info/hint)
vim.keymap.set("n", "<leader>lk", function() vim.diagnostic.goto_prev({ float = false })  end, opts)
--

-- autocomplete needs plugin "hrsh7th/nvim-cmp"
local cmp = require('cmp')
cmp.setup({
    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ['<C-j>'] = cmp.mapping.select_next_item(),         -- Next item
        ['<C-k>'] = cmp.mapping.select_prev_item(),         -- Previous item
    }
})
--

-- searching
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>st', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope help tags' })
--

-- file explorer
-- needs plugin "nvim-tree/nvim-tree"
vim.keymap.set("n", "<leader>e", function()
  require("nvim-tree.api").tree.toggle({
    -- path = "<args>",
    find_file = true,
    update_root = true,
    focus = true,
  }) end
)
--
