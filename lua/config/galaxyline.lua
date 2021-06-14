local gl = require 'galaxyline'
local gls = gl.section
local vcs = require 'galaxyline.provider_vcs'
local vim = vim

gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'startify', 'packer'}

-- Gruvbox
local colors = {
    black0 = '#282828',
    black1 = '#3c3836',
    black2 = '#504945',
    black3 = '#665c54',
    black4 = '#7c6f64',
    white0 = '#fbf1c7',
    white1 = '#ebdbb2',
    white2 = '#d5c4a1',
    white3 = '#bdae93',
    white4 = '#a89984',
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
    ['n'] = {'NORMAL', colors.white0, colors.black2},
    ['i'] = {'INSERT', colors.yellow, colors.black2},
    ['R'] = {'REPLACE', colors.red, colors.black2},
    ['v'] = {'VISUAL', colors.blue, colors.black2},
    ['V'] = {'V-LINE', colors.blue, colors.black2},
    ['c'] = {'COMMAND', colors.orange, colors.black2},
    ['s'] = {'SELECT', colors.green, colors.black2},
    ['S'] = {'S-LINE', colors.green, colors.black2},
    ['t'] = {'TERMINAL', colors.bright_purple, colors.black2},
    [''] = {'V-BLOCK', colors.magenta, colors.black2},
    [''] = {'S-BLOCK', colors.magenta, colors.black2},
    ['Rv'] = {'VIRTUAL'},
    ['rm'] = {'--MORE'}
}

local sep = {
    right_filled = '', -- e0b2
    left_filled = '', -- e0b0
    right = '', -- e0b3
    left = '' -- e0b1
}

local icons = {
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

local function buffer_not_empty()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then return true end
    return false
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
            highlight('ViMode', colors.black0, bg, 'bold')
            highlight('ViModeSep', bg, nested_bg)
            highlight('FileName', colors.white1, nested_bg, 'bold')
            highlight('FileNameSep', nested_bg, colors.black0)
            highlight('GitBranch', colors.bright_red, colors.black0)
            highlight('DiffAdd', colors.green, colors.black0)
            highlight('DiffModified', colors.yellow, colors.black0)
            highlight('DiffRemove', colors.red, colors.black0)
            return '  Giangvp99 '
        end,
        highlight = 'ViMode',
        separator = sep.left_filled,
        separator_highlight = 'ViModeSep'
    }
}

gls.left[2] = {
    FileName = {
        provider = function()
            if not buffer_not_empty() then return "" end
            local fname
            if wide_enough(120) then
                fname = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')
            else
                fname = vim.fn.expand '%:t'
            end
            if #fname == 0 then return sep.left_filled end
            if vim.bo.readonly then fname = fname .. ' ' .. icons.locker end
            if not vim.bo.modifiable then fname = fname .. ' ' .. icons.not_modifiable end
            if vim.bo.modified then fname = fname .. ' ' .. icons.pencil end

            return ' ' .. fname .. ' '
        end,
        highlight = 'FileName',
        separator = sep.left_filled,
        separator_highlight = "FileNameSep"
        -- condition = buffer_not_empty
    }
}

gls.left[5] = {
    Paste = {
        provider = function()
            if vim.o.paste then return 'Paste ' end
            return ''
        end,
        icon = '   ',
        highlight = {colors.bright_red, colors.bg1}
    }
}

local function check_git_workspace()
    if vim.bo.buftype == 'terminal' then return false end
    local current_file = vim.fn.expand('%:p')
    local current_dir
    -- if file is a symlinks
    if vim.fn.getftype(current_file) == 'link' then
        local real_file = vim.fn.resolve(current_file)
        current_dir = vim.fn.fnamemodify(real_file, ':h')
    else
        current_dir = vim.fn.expand('%:p:h')
    end
    local result = vcs.get_git_dir(current_dir)
    if not result then return false end
    return true
end

gls.left[6] = {
    GitIcon = {
        provider = function()
            return '  '
        end,
        condition = check_git_workspace,
        highlight = {colors.bright_red, colors.black0}
    }
}
gls.left[7] = {
    GitBranch = {
        provider = "GitBranch",
        condition = check_git_workspace,
        highlight = "GitBranch",
        separator = " ",
        separator_highlight = {colors.black0, colors.black0}
    }
}
gls.left[9] = {
    DiffAdd = {
        provider = 'DiffAdd',
        icon = ' ',
        highlight = 'DiffAdd'
        -- separator = " ",
        -- separator_highlight = {colors.black0, colors.black0}
    }
}
gls.left[10] = {
    DiffModified = {
        provider = 'DiffModified',
        icon = ' ',
        highlight = 'DiffModified'
        -- separator = " ",
        -- separator_highlight = {colors.black0, colors.black0}
    }
}
gls.left[11] = {
    DiffRemove = {
        provider = 'DiffRemove',
        icon = ' ',
        highlight = 'DiffRemove'
        -- separator = " ",
        -- separator_highlight = {colors.black0, colors.black0}
    }
}

gls.right[1] = {
    DiagnosticWarn = {provider = 'DiagnosticWarn', icon = '  ', highlight = {colors.bright_yellow, colors.black0}}
}
gls.right[2] = {
    DiagnosticError = {provider = 'DiagnosticError', icon = '  ', highlight = {colors.bright_red, colors.black0}}
}
gls.right[3] = {
    DiagnosticHint = {provider = 'DiagnosticHint', icon = '  ', highlight = {colors.bright_blue, colors.black0}}
}

gls.right[4] = {
    DiagnosticInfo = {provider = 'DiagnosticInfo', icon = '  ', highlight = {colors.bright_blue, colors.black0}}
}
gls.right[6] = {
    FileFormat = {
        provider = function()
            if not buffer_not_empty() or not wide_enough(70) then return '' end
            local icon = icons[vim.bo.fileformat] or ''
            return string.format(' %s %s ', icon, vim.bo.fileencoding)
        end,
        highlight = 'FileName',
        separator = sep.right_filled,
        separator_highlight = "FileNameSep"
    }
}
gls.right[8] = {
    PositionInfo = {
        provider = function()
            highlight('Info', colors.black0, colors.white0, 'bold')
            highlight('InfoSep', colors.white0, colors.black2, 'bold')
            if not buffer_not_empty() or not wide_enough(60) then return '' end
            return string.format(' %s %s:%s ', icons.line_number, vim.fn.line('.'), vim.fn.col('.'))
        end,
        highlight = 'Info',
        separator = sep.right_filled,
        separator_highlight = 'InfoSep'
    }
}
gls.right[9] = {
    PercentInfo = {
        provider = function()
            if not buffer_not_empty() or not wide_enough(65) then return '' end
            local percent = math.floor(100 * vim.fn.line('.') / vim.fn.line('$'))
            return string.format(' %s %s%s', icons.page, percent, '% ')
        end,
        highlight = 'Info',
        separator = sep.right,
        separator_highlight = 'Info'
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
            local _, bg, nested_bg = unpack(mode_hl())
            highlight('ViMode', colors.black0, bg, 'bold')
            highlight('ViModeSep', bg, nested_bg, 'bold')
            local name = short_map[vim.bo.filetype] or 'Editor'
            return string.format('  %s ', name)
        end,
        highlight = 'ViMode',
        condition = has_file_type,
        separator = sep.left_filled,
        separator_highlight = 'ViModeSep'
    }
}
