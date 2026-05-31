return {
  "neovim/nvim-lspconfig",
  version = "*",
  lazy = false,
  config = function()
    require("nvim-tree").setup {}
  end,
}
