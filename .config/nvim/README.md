# Config for neovim version 0.12.2
### Starting from 0.12.x, lsp client and treesitter support is included as native so no plugins for that
### That said, "neovim/nvim-lspconfig" plugin is used just for importing its default lsp configs

#### Requirements for tree-sitter-manager
- `tree-sitter-cli`, installed by `cargo install --locked tree-sitter-cli`
Then install languages support running `TSInstall <language>`

#### Used for
Treesitter &rarr; Syntax highlighting
LSP (Language server protocol) &rarr; Diagnostics (Erros, warning, info, hints, etc)
DAP (Debugger adapter protocol) &rarr; Neovim integration to debugging server like clangd
