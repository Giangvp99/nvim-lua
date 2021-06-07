local utils = require "config.utils"

-- local function documentHighlight(client, bufnr)
--     -- Set autocommands conditional on server_capabilities
--     if client.resolved_capabilities.document_highlight then
--         vim.api.nvim_exec([[
--           hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
--           hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
--           hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
--           augroup lsp_document_highlight
--             autocmd! * <buffer>
--             autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--             autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--           augroup END
--         ]], false)
--     end
-- end

local lsp_config = {}
local cfg = {
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    -- If you want to hook lspsaga or other signature handler, pls set to false
    doc_lines = 10, -- only show one line of comment set to 0 if you do not want API comments be shown

    hint_enable = false, -- virtual hint enable
    hint_prefix = "  ", -- Panda for parameter
    hint_scheme = "String",
    max_width = 120,
    max_height = 12,
    use_lspsaga = false,

    handler_opts = {
        border = "single" -- double, single, shadow, none
    },
    decorator = {"**", "**"} -- or decorator = {"***", "***"}  decorator = {"**", "**"} see markdown help

}
function lsp_config.on_attach(client, bufnr)
    -- documentHighlight(client, bufnr)
    -- local function buf_set_keymap(...)
    --     vim.api.nvim_buf_set_keymap(bufnr, ...)
    -- end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    require"lsp_signature".on_attach(cfg)

    utils.map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    utils.map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    utils.map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    utils.map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    utils.map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    utils.map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    utils.map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    -- utils.map('n', '<leader>gw', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    -- utils.map('n', '<leader>gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
    -- utils.map('n', '<leader>ah', '<cmd>lua vim.lsp.buf.hover()<CR>')
    -- utils.map('n', '<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    -- utils.map('n', '<leader>ee', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
    -- utils.map('n', '<leader>ar', '<cmd>lua vim.lsp.buf.rename()<CR>')
    -- utils.map('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    -- utils.map('n', '<leader>ai', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
    -- utils.map('n', '<leader>ao', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end

function lsp_config.capabilities()
    capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport =
        {properties = {'documentation', 'detail', 'additionalTextEdits'}}
    return capabilities
end

return lsp_config
