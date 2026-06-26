-- loading lazy.nvim
require("config.lazy")

vim.cmd("colorscheme kanagawa")

require('config.nvim-lspconfig')
require('config.editor')
require('config.indent-blankline')

require('config.nvim-cmp')
require('config.nvim-dap')
require('config.nvim-dap-ui')

require('config.toggleterm')

require('config.nvim-tree')

require('config.keymaps')
require('config.conform')
