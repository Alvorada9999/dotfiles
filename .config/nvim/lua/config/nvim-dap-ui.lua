local dapUi = require('dapui')

dapUi.setup({
  -- Automatically expands elements with long lines.
  expand_lines = true,

  layouts = {
    {
      elements = {
        -- The elements can be tables with IDs and proportional size....
        { id = "scopes", size = 0.33 },
        -- { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.33 },
        { id = "watches", size = 0.34 },
      },
      size = 0.3,            -- Column width (or ratio if < 1.0)
      position = "top",      -- Panel position: "left", "right", "top", "bottom"
    }
  },
  -- Fine-tuning the display of complex data.
  render = {
    max_type_length = nil,  -- Maximum size displayed for the data type. (int, string, etc)
    max_value_lines = 100,  -- Line limit when expanding giant strings. (prevents crashes)
  }
})
