-- python
local python_arguments = {}

-- TODO replace with path argument
local flake8 = {
    LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}

local isort = {formatCommand = "isort --quiet -", formatStdin = true}

-- local yapf = {formatCommand = "yapf --quiet", formatStdin = true}
local black = {formatCommand = "black --quiet -", formatStdin = true}

table.insert(python_arguments, flake8)

-- table.insert(python_arguments, isort)

-- table.insert(python_arguments, black)

-- lua
local lua_arguments = {}

local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}

-- local lua_fmt = {formatCommand = "luafmt --indent-count 2 --line-width 120 --stdin", formatStdin = true}

table.insert(lua_arguments, luaFormat)

-- tsserver/web javascript react, vue, json, html, css, yaml
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
-- You can look for project scope Prettier and Eslint with e.g. vim.fn.glob("node_modules/.bin/prettier") etc. If it is not found revert to global Prettier where needed.
-- local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}

local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local tsserver_args = {}

table.insert(tsserver_args, prettier)

table.insert(tsserver_args, eslint)

require'lspconfig'.efm.setup {
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"lua"},
    settings = {
        languages = {
            lua = lua_arguments,
            python = python_arguments,
            typescript = tsserver_args,
            javascript = tsserver_args,
            typescriptreact = tsserver_args,
            html = {prettier},
            css = {prettier}
        }
    }
}
