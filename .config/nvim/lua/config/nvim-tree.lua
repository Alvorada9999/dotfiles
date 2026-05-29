require("nvim-tree").setup({
  -- ... your existing nvim-tree options
  view = {
    float = {
      enable = true, -- ENABLES floating mode on top of everything!
      quit_on_focus_loss = true, -- Optional: Closes the tree automatically if you click away
      open_win_config = {
        relative = "editor",
        border = "rounded", -- Adds a clean frame ("rounded", "single", "double")
        width = 35,         -- Fixed width of the floating explorer
        height = 30,        -- Fixed height of the floating explorer
        row = 0,            -- Vertical position (top alignment)
        col = 0,            -- Horizontal position (left alignment)
      },
    },
  },
})

