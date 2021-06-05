O = {
    auto_close_tree = 0,
    auto_complete = true,
    colorscheme = 'nvcode',
    hidden_files = true,
    wrap_lines = false,
    number = true,
    relative_number = true,
    shell = 'zsh',

    -- @usage pass a table with your desired languages
    treesitter = {
        ensure_installed = "all",
        ignore_install = {"haskell"},
        highlight = {enabled = true},
        playground = {enabled = true},
        rainbow = {enabled = false}
    },

    python = {
        linter = '',
        -- @usage can be 'yapf', 'black'
        formatter = '',
        autoformat = false,
        isort = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true},
        analysis = {type_checking = "basic", auto_search_paths = true, use_library_code_types = true}
    },
    lua = {
        -- @usage can be 'lua-format'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    sh = {
        -- @usage can be 'shellcheck'
        linter = '',
        -- @usage can be 'shfmt'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    tsserver = {
        -- @usage can be 'eslint'
        linter = 'eslint',
        -- @usage can be 'prettier'
        formatter = 'prettier',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    json = {
        -- @usage can be 'prettier'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    tailwindls = {filetypes = {'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}},
    clang = {diagnostics = {virtual_text = true, signs = true, underline = true}},
    -- css = {formatter = '', autoformat = false, virtual_text = true},
    -- json = {formatter = '', autoformat = false, virtual_text = true}
    dashboard = {
        custom_header = {
            '███    ██ ███████  ██████  ██    ██ ██ ███    ███ ',
            '████   ██ ██      ██    ██ ██    ██ ██ ████  ████ ',
            '██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██ ',
            '██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██ ',
            '██   ████ ███████  ██████    ████   ██ ██      ██ '
        }
    }
}

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
