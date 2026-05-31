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

-- language server-specific settings goes under the "settings" field

-- vim.lsp.config['clangd'] = {
-- 	cmd = { "clangd" }, -- or full path: "/usr/bin/clangd"
-- 	capabilities = capabilities,
-- 	filetypes = { "c", "cpp", "objc", "objcpp" },
-- 	root_markers = { { 'compile_flags.txt', 'compile_commands.json' }, '.git' },
-- 	init_options = {
-- 		clangdFileStatus = true,
-- 		completeUnimported = true,
-- 	},
-- }
vim.lsp.enable('clangd')

-- vim.lsp.config['lua-language-server'] = {
-- 	cmd = { "lua-language-server" },
-- 	capabilities = capabilities,
-- 	filetypes = { "lua" },
-- }
vim.lsp.enable('lua-language-server')

-- npm install -g typescript typescript-language-server
-- vim.lsp.config['tsserver'] = {
--   cmd = {'typescript-language-server', '--stdio'},
--   capabilities = capabilities,
--   filetypes = { 'typescript', 'javascript' },
--   root_dir = vim.fs.root(0, {'package.json', '.git'}),
--   settings = {
--     diagnosticsSupport = true
--   }
--   -- optional settings = {...} go here, refer to language server code: https://github.com/typescript-language-server/typescript-language-server/blob/5c483349b7b4b6f79d523f8f4d854cbc5cec7ecd/src/ts-protocol.ts#L379
-- }
-- vim.lsp.enable('tsserver')
vim.lsp.enable('ts_ls')
