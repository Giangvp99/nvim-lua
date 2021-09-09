local cmp = require 'cmp'
local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end
local WIDE_HEIGHT = 40
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
            elseif check_back_space() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n')
            elseif vim.fn['vsnip#available'](1) == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, true, true), '')
            else
                fallback()
            end
        end),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
            elseif check_back_space() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<S-Tab>', true, true, true), 'n')
            elseif vim.fn['vsnip#available'](-1) == 1 then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-jump-prev)', true, true, true), '')
            else
                fallback()
            end
        end)

    },
    documentation = {
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"},
        winhighlight = 'NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder',
        maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
        maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines))
    },
    sources = {{name = 'buffer'}, {name = 'nvim_lsp'}, {name = 'calc'}, {name = 'vsnip'}},
    formatting = {
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

            -- set a name for each source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]"
            })[entry.source.name]
            return vim_item
        end
    }

})

-- you need setup cmp first put this after cmp.setup()
require("nvim-autopairs.completion.cmp").setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` after select function or method item
    auto_select = true -- automatically select the first item
})

