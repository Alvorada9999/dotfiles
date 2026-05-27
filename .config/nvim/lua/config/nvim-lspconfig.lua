local capabilities = vim.lsp.protocol.make_client_capabilities()
-- in order to enable autocomplete make use of nvim-cmp or enable vim.o.autocomplete
-- here I use nvim-cmp because the preview is better
-- vim.o.autocomplete = true
-- if using nvim-cmp, augment capabilities here:
local cmp_nvim_lsp = require("cmp_nvim_lsp")
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

vim.lsp.config['clangd'] = {
	capabilities = capabilities,
	cmd = { "clangd" }, -- or full path: "/usr/bin/clangd"
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_markers = { { 'compile_flags.txt', 'compile_commands.json' }, '.git' },
	init_options = {
		clangdFileStatus = true,
		completeUnimported = true,
	},
	handlers = {
		-- optional: customize hover/diagnostics handlers
	},
}
vim.lsp.enable('clangd')

vim.lsp.config['lua-language-server'] = {
	capabilities = capabilities,
	cmd = { "lua-language-server" }, -- or full path: "/usr/bin/clangd"
	filetypes = { "lua" },
	-- root_markers = { { 'compile_flags.txt', 'compile_commands.json' }, '.git' },
	-- init_options = {
	-- 	clangdFileStatus = true,
	-- 	completeUnimported = true,
	-- },
	handlers = {
		-- optional: customize hover/diagnostics handlers
	},
}
vim.lsp.enable('lua-language-server')
