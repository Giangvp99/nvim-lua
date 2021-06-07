require'which-key'.setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "" -- symbol prepended to a group
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

local mappings = {
    ["/"] = {'<cmd>CommentToggle<cr>', 'Comment'},
    ["e"] = {'<cmd>NvimTreeToggle<cr>', 'Explorer'},
    ["n"] = {'<cmd>set hlsearch!<cr>', 'No Highlight'},
    ["?"] = {'<cmd>NvimTreeFindFile<cr>', '???'},
    ["r"] = {'<cmd>RnvimrToggle<cr>', 'Ranger'},
    [" "] = {'<cmd><Esc><cr>', "Ignore"},
    --[[ d = {
        name = "+debug",
        b = {"<cmd>debugtogglebreakpoint<cr>", "toggle breakpoint"},
        c = {"<cmd>debugcontinue<cr>", "continue"},
        i = {"<cmd>debugstepinto<cr>", "step into"},
        o = {"<cmd>debugstepover<cr>", "step over"},
        r = {"<cmd>debugtogglerepl<cr>", "toggle repl"},
        s = {"<cmd>debugstart<cr>", "start"}
    }, ]]
    [","] = {
        name = "Emmet",
        [','] = {'<Plug>(emmet-expand-abbr)', 'expand abbr'},
        ['n'] = {'<plug>(emmet-move-next)', 'move next'},
        ['N'] = {'<plug>(emmet-move-prev)', 'move prev'},
        ['/'] = {'<plug>(emmet-toggle-comment)', 'toggle comment'},
        ['k'] = {'<plug>(emmet-remove-tag)', 'remove tag'},
        [' '] = {'<Esc>', 'ignore'}
    },
    g = {
        name = "Git",
        j = {"<cmd>NextHunk<cr>", "Next Hunk"},
        k = {"<cmd>PrevHunk<cr>", "Prev Hunk"},
        p = {"<cmd>PreviewHunk<cr>", "Preview Hunk"},
        r = {"<cmd>ResetHunk<cr>", "Reset Hunk"},
        R = {"<cmd>ResetBuffer<cr>", "Reset Buffer"},
        s = {"<cmd>StageHunk<cr>", "Stage Hunk"},
        u = {"<cmd>UndoStageHunk<cr>", "Undo Stage Hunk"},
        o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
        C = {"<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)"},
        [" "] = {"<ESC>", "Close"}
    },
    b = {
        name = "Buffers",
        n = {"<cmd>BufferLineCycleNext<cr>", "next"},
        p = {"<cmd>BufferLineCyclePrev<cr>", "prev"},
        b = {"<cmd>BufferLinePick<cr>", "pick"},
        d = {"<cmd>:bw<cr>", "delete"},
        w = {"<cmd>:w<cr>", "write"},
        r = {"<cmd>:luafile %<cr>", "reload"},
        [" "] = {"<ESC>", "Close"}
    },
    l = {
        name = "LSP",
        f = {"<cmd>LspFormatting<cr>", "Format"},
        d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Definition"},
        D = {"<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration"},
        r = {"<cmd>lua vim.lsp.buf.references()<cr>", "References"},
        i = {"<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation"},
        a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
        H = {"<cmd>Lspsaga hover_doc<cr>", "Hover Document"},
        p = {"<cmd>Lspsaga diagnostic_jump_prev", "Previous Diagnostic"},
        n = {"<cmd>Lspsata diagnostic_jump_next", "Next Diagnostic"},
        [" "] = {"<ESC>", "Close"}
    },
    s = {
        name = "Search",
        b = {"<cmd>Telescope buffers<cr>", "Buffers"},
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        m = {"<cmd>Telescope marks<cr>", "Marks"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"},
        [" "] = {"<ESC>", "Close"}
    },
    t = {
        name = "Terminal",
        r = {"<cmd>FloatermNew ranger<cr>", "ranger"},
        t = {"<cmd>FloatermToggle<cr>", "terminal"},
        n = {"<cmd>FloatermNew<cr>","new terminal"},
        [" "] = {"<ESC>", "Close"}
    },
    S = {
        name = "Session",
        s = {"<cmd>SessionSave<cr>", "Save Session"},
        l = {"<cmd>SessionLoad<cr>", "Load Session"},
        [" "] = {"<ESC>", "Close"}
    },
    R = {
        name = "Find and Replace",
        f = {"<cmd>Farr --source=vimgrep<cr>", "File"},
        p = {"<cmd>Farr --source=rgnvim<cr>", "Project"},
        [" "] = {"<ESC>", "Close"}
    },
    q = {"<cmd>:qa<cr>", "Quit Vim"}
}

local wk = require "which-key"
wk.register(mappings, opts)
