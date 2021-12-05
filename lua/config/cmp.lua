local cmp = require 'cmp'
local check_backspace = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end
local function T(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local WIDE_HEIGHT = 40
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    mapping = {
        ['<A-[>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<A-]>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-c>'] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}),
        ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = false}),
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn['vsnip#available'](1) == 1 then
                vim.fn.feedkeys(T "<Plug>(vsnip-expand-or-jump)", "")
            elseif check_backspace() then
                vim.fn.feedkeys(T "<Tab>", "n")
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn['vsnip#available'](-1) == 1 then
                vim.fn.feedkeys(T '<Plug>(vsnip-jump-prev)', '')
            elseif check_backspace() then
                vim.fn.feedkeys(T '<S-Tab>', 'n')
            else
                fallback()
            end
        end

    },
    documentation = {
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"},
        winhighlight = 'NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder',
        maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
        maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines))
    },
    formatting = {
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " ..
                                vim_item.kind

            -- set a name for each source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
                vsnip = "[Snip]"
            })[entry.source.name]
            return vim_item
        end
    },
    sources = cmp.config.sources({{name = 'nvim_lsp'}, {name = 'vsnip'}}, {
        {name = 'buffer'}, {name = 'calc'}, {name = 'path'}, {name = 'cmdline'}
    }),
    -- completion = {autocomplete = true}
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})})
-- you need setup cmp first put this after cmp.setup()
-- require("nvim-autopairs.completion.cmp").setup({
--     map_cr = true, --  map <CR> on insert mode
--     map_complete = true, -- it will auto insert `(` after select function or method item
--     auto_select = true -- automatically select the first item
-- })
