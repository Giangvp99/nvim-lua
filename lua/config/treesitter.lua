require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    autotag = {
        enable = true,
        filetypes = {"xml", "typescriptreact", "javascriptreact", "jinja", "html"}
    },
    highlight = {
        enable = true -- false will disable the whole extension
    },
    indent = {enable = true, disable = {"yaml"}},
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
    },
    refactor = {highlight_definitions = {enable = true}, highlight_current_scope = {enable = true}},
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = {}, -- table of hex strings
        termcolors = {} -- table of colour name strings
    },
    autopairs = {enable = true}
}
