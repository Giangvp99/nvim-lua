-- python
local python_arguments = {}

-- TODO replace with path argument
local flake8 = {
    LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}

local isort = {formatCommand = "isort --quiet -", formatStdin = true}

local yapf = {formatCommand = "yapf --quiet", formatStdin = true}
local black = {formatCommand = "black --quiet -", formatStdin = true}

if O.python.linter == 'flake8' then table.insert(python_arguments, flake8) end

if O.python.isort then table.insert(python_arguments, isort) end

if O.python.formatter == 'yapf' then
    table.insert(python_arguments, yapf)
elseif O.python.formatter == 'black' then
    table.insert(python_arguments, black)
end

-- lua
local lua_arguments = {}

local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}

local lua_fmt = {formatCommand = "luafmt --indent-count 2 --line-width 120 --stdin", formatStdin = true}

if O.lua.formatter == 'lua-format' then
    table.insert(lua_arguments, luaFormat)
elseif O.lua.formatter == 'lua-fmt' then
    table.insert(lua_arguments, lua_fmt)
end

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

if O.tsserver.formatter == 'prettier' then table.insert(tsserver_args, prettier) end

if O.tsserver.linter == 'eslint' then table.insert(tsserver_args, eslint) end

require'lspconfig'.efm.setup {
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"lua", "typescript", "typescriptreact", "javascript", "python", "html", "css"},
    settings = {
        languages = {
            python = python_arguments,
            lua = lua_arguments,
            typescript = tsserver_args,
            javascript = tsserver_args,
            typescriptreact = tsserver_args,
            html = {prettier},
            css = {prettier}
        }
    }
}
