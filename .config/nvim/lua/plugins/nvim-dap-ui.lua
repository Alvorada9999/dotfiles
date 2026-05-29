return {
  "rcarriga/nvim-dap-ui",
  version = "*",
  lazy = false,
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    require("dapui").setup {}
  end,
}
