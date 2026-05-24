local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            -- not installed
            require('luasnip').lsp_expand(args.body) -- Use LuaSnip for snippets
        end,
    },
    sources = {
        { name = 'nvim_lsp' }, -- LSP source
        { name = 'buffer' },   -- Buffer source
        { name = 'path' },     -- Path source
        { name = 'luasnip' },  -- Snippet source
    },
})
