-- Refer to
-- https://neovim.io/doc/user/lsp/

-- !!! USING CONFIG PROVIDED BY "nvim-lsp-config" PLUGIN AUTOMATICALLY !!!
-- That said, keep in mind enabling the lsp for said lsp server with "vim.lsp.enable('<binary_name>')" must use the same name
-- from files at https://github.com/neovim/nvim-lspconfig/tree/master/lsp (Minus file extension)

-- show all diagnostics (errors, warnings, info, hints)
vim.diagnostic.config({
  virtual_text = true, -- inline text
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    }
  },
  -- underline = true,          -- underline text
  -- update_in_insert = false,  -- don't update while typing (optional)
  severity_sort = true,      -- sort by severity when multiple diagnostics on a line
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- in order to enable autocomplete make use of nvim-cmp or enable vim.o.autocomplete
-- here I use nvim-cmp because the preview is better
-- vim.o.autocomplete = true
-- if using nvim-cmp, augment capabilities here:
local cmp_nvim_lsp = require("cmp_nvim_lsp")
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
vim.lsp.config("*", { capabilities = capabilities })

-- install clangd from system package manager
vim.lsp.enable('clangd')

--vim.lsp.enable('lua-language-server')

-- npm install -g typescript typescript-language-server
vim.lsp.enable('ts_ls')

-- install https://github.com/supabase-community/postgres-language-server
-- npm install -g @postgres-language-server/cli
-- postgres-language-server init to create "postgres-language-server.jsonc"
-- DO NOT update the "$schema" field
-- update the credentials at "db": {}
vim.lsp.enable('postgres_lsp')
