local gl = require 'galaxyline'
local gls = gl.section
local fileinfo = require 'galaxyline.provider_fileinfo'
local condition = require 'galaxyline.condition'
local vim = vim
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'startify', 'packer'}

-- Gruvbox
local colors = {
    bg = '#282828',
    -- black1 = '#3c3836',
    -- black2 = '#504945',
    -- black3 = '#665c54',
    -- black4 = '#7c6f64',
    -- white1 = '#ebdbb2',
    -- white2 = '#d5c4a1',
    -- white3 = '#bdae93',
    -- white4 = '#a89984',
    white = '#fbf1c7',
    gray = '#928374',
    bright_red = '#fb4934',
    bright_green = '#b8bb26',
    bright_yellow = '#fabd2f',
    bright_blue = '#83a598',
    bright_purple = '#d3869b',
    bright_aqua = '#8ec07c',
    bright_orange = '#fe8019',
    yellow = '#fabd2f',
    cyan = '#008080',
    green = '#608B4E',
    orange = '#FF8800',
    purple = '#5d4d7a',
    magenta = '#d16d9e',
    grey = '#c0c0c0',
    blue = '#569CD6',
    red = '#D16969'
}

local mode_map = {
    ['n'] = {'NORMAL', colors.white, colors.bg},
    ['i'] = {'INSERT', colors.yellow, colors.bg},
    ['R'] = {'REPLACE', colors.red, colors.bg},
    ['v'] = {'VISUAL', colors.blue, colors.bg},
    ['V'] = {'V-LINE', colors.blue, colors.bg},
    ['c'] = {'COMMAND', colors.orange, colors.bg},
    ['s'] = {'SELECT', colors.green, colors.bg},
    ['S'] = {'S-LINE', colors.green, colors.bg},
    ['t'] = {'TERMINAL', colors.bright_purple, colors.bg},
    [''] = {'V-BLOCK', colors.magenta, colors.bg},
    [''] = {'S-BLOCK', colors.magenta, colors.bg},
    ['Rv'] = {'VIRTUAL'},
    ['rm'] = {'--MORE'}
}

-- local sep = {
--     right_filled = '', -- e0b2
--     left_filled = '', -- e0b0
--     right = '', -- e0b3
--     left = '', -- e0b1
--     a = '/'
-- }

local icons = {
    git = '',
    paste = '',
    locker = '', -- f023
    not_modifiable = '', -- f05e
    unsaved = '', -- f0c7
    pencil = '', -- f040
    dos = '', -- e70f
    unix = '', -- f17c
    mac = '', -- f179
    page = '☰', -- 2630
    line_number = '', -- e0a1
    connected = '', -- f817
    disconnected = '', -- f818
    error = '', -- f658
    warning = '', -- f06a
    info = '' -- f05a
}

local function mode_hl()
    local mode = mode_map[vim.fn.mode()]
    if mode == nil then
        mode = mode_map['v']
        return {'V-BLOCK', mode[2], mode[3]}
    end
    return mode
end

local function highlight(group, fg, bg, gui)
    local cmd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)
    if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
    vim.cmd(cmd)
end

local function wide_enough(width)
    local squeeze_width = vim.fn.winwidth(0)
    if squeeze_width > width then return true end
    return false
end
gls.left[1] = {
    ViMode = {
        provider = function()
            local _, bg, nested_bg = unpack(mode_hl())
            highlight('ViMode', bg, nested_bg, 'bold')
            return '  Giangvp99 '
        end,
        highlight = 'ViMode'
    }
}

gls.left[2] = {
    FileName = {
        provider = function()
            -- if not condition.buffer_not_empty() then return "" end
            local fname
            if wide_enough(120) then
                fname = vim.fn.fnamemodify(vim.fn.expand('%'), ':p:h')
            else
                fname = vim.fn.expand '%:h'
            end
            if vim.bo.readonly then fname = fname .. ' ' .. icons.locker end
            if not vim.bo.modifiable then fname = fname .. ' ' .. icons.not_modifiable end
            if vim.bo.modified then fname = fname .. ' ' .. icons.pencil end

            return '  ' .. fname .. ' '
        end,
        highlight = {colors.bright_aqua, colors.bg, 'bold'},
        condition = condition.buffer_not_empty
    }
}
gls.left[3] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = icons.page,
        separator_highlight = {colors.yellow, colors.bg},
        highlight = {colors.orange, colors.bg},
        condition = condition.buffer_not_empty
    }
}

gls.left[4] = {
    PerCent = {
        provider = 'LinePercent',
        highlight = {colors.bright_yellow, colors.bg},
        condition = condition.buffer_not_empty
    }
}
gls.left[6] = {
    GitIcon = {
        provider = function()
            return icons.git
        end,
        condition = condition.check_git_workspace,
        highlight = {colors.bright_red, colors.bg},
        separator = ' ',
        separator_highlight = {'NONE', colors.bg}

    }
}
gls.left[7] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        highlight = {colors.bright_red, colors.bg},
        separator = ' ',
        separator_highlight = {'NONE', colors.bg}

    }
}
gls.left[9] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.check_git_workspace,
        icon = ' ',
        highlight = {colors.green, colors.bg}
        -- separator = ' ',
        -- separator_highlight = {'NONE', colors.bg}
    }
}
gls.left[10] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.check_git_workspace,
        icon = ' ',
        highlight = {colors.yellow, colors.bg}
        -- separator = ' ',
        -- separator_highlight = {'NONE', colors.bg}
    }
}
gls.left[11] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.check_git_workspace,
        icon = ' ',
        highlight = {colors.red, colors.bg}
    }
}
gls.right[0] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.bright_red, colors.bg}
    }
}
gls.right[1] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.bright_yellow, colors.bg}
    }
}
gls.right[2] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {colors.blue, colors.bg}
    }
}

gls.right[3] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.blue, colors.bg}
    }
}
gls.right[4] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function()
            local tbl = {['dashboard'] = true, [''] = true}
            if tbl[vim.bo.filetype] then return false end
            return true
        end,
        icon = '  ',
        highlight = {colors.cyan, colors.bg, 'bold'}
    }
}
gls.right[5] = {
    FileIcon = {
        provider = 'FileIcon',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {fileinfo.get_file_icon_color, colors.bg, 'bold'}
    }
}
gls.right[6] = {
    FileTypeName = {
        provider = 'FileTypeName',
        -- separator = ' ',
        -- separator_highlight = {'NONE', colors.bg},
        highlight = {fileinfo.get_file_icon_color, colors.bg, 'bold'}
    }
}
local function my_condition()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 50 and vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then return true end
    return false
end
gls.right[10] = {
    FileEncode = {
        provider = 'FileEncode',
        highlight = {colors.green, colors.bg},
        condition = my_condition,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg}
    }
}

gls.right[11] = {
    FileFormat = {
        provider = 'FileFormat',
        highlight = {colors.green, colors.bg},
        condition = my_condition,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg}
    }
}
gls.right[12] = {
    WhiteSpace = {
        provider = 'WhiteSpace',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        condition = my_condition
    }
}
local short_map = {
    ['NvimTree'] = 'NvimTree',
    ['startify'] = 'Starfity',
    ['tagbar'] = 'Tagbar',
    ['Mundo'] = 'History',
    ['MundoDiff'] = 'Diff'
}

local function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then return false end
    return true
end

gls.short_line_left[1] = {
    BufferType = {
        provider = function()
            highlight('NvimTree', colors.bright_purple, colors.bg, 'bold')
            highlight('NVimTreeSep', colors.bright_orange, colors.bg, 'bold')
            local name = short_map[vim.bo.filetype] or 'Editor'
            return string.format('  %s ', name)
        end,
        highlight = 'NvimTree',
        condition = has_file_type,
        separator = ' ',
        separator_highlight = 'NVimTreeSep'
    }
}
