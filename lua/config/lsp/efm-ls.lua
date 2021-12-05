local languages = {
    javascript = {{formatCommand = 'prettier --stdin-filepath ${INPUT}', formatStdin = true}},
    lua = {
        {
            formatCommand = 'lua-format -i --no-keep-simple-function-one-line --column-limit=100',
            formatStdin = true
        }
    },
    python = {{formatCommand = 'black --quiet -', formatStdin = true}}
}
require"lspconfig".efm.setup {
    init_options = {documentFormatting = true, codeAction = false},
    settings = {
        -- rootMarkers = { ".git/" },
        languages = languages
    },
    filetypes = vim.tbl_keys(languages)
}
