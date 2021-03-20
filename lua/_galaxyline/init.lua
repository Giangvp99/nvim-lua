local gl = require 'galaxyline'
local gls = gl.section
local devicons = require 'nvim-web-devicons'
local vcs = require 'galaxyline.provider_vcs'
local vim = vim

gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'startify', 'packer'}

-- Gruvbox
local colors = {
  bg0_h = '#1d2021',
  bg0 = '#282828',
  bg1 = '#3c3836',
  bg2 = '#504945',
  bg3 = '#665c54',
  bg4 = '#7c6f64',
  gray = '#928374',
  fg0 = '#fbf1c7',
  fg1 = '#ebdbb2',
  fg2 = '#d5c4a1',
  fg3 = '#bdae93',
  fg4 = '#a89984',
  bright_red = '#fb4934',
  bright_green = '#b8bb26',
  bright_yellow = '#fabd2f',
  bright_blue = '#83a598',
  bright_purple = '#d3869b',
  bright_aqua = '#8ec07c',
  bright_orange = '#fe8019',
  -- neutral_red = '#cc241d',
  -- neutral_green = '#98971a',
  -- neutral_yellow = '#d79921',
  -- neutral_blue = '#458588',
  -- neutral_purple = '#b16286',
  -- neutral_aqua = '#689d6a',
  -- neutral_orange = '#d65d0e',
  -- faded_red = '#9d0006',
  -- faded_green = '#79740e',
  -- faded_yellow = '#b57614',
  -- faded_blue = '#076678',
  -- faded_purple = '#8f3f71',
  -- faded_aqua = '#427b58',
  -- faded_orange = '#af3a03',
  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#608B4E',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#d16d9e',
  grey = '#c0c0c0',
  blue = '#569CD6',
  red = '#D16969'
}

local mode_map = {
  ['n'] = {'NORMAL', colors.fg3, colors.bg2},
  -- ['n'] = {'NORMAL', colors.bright_green, colors.faded_green},
  ['i'] = {'INSERT', colors.blue, colors.bg2},
  ['R'] = {'REPLACE', colors.red, colors.bg2},
  ['v'] = {'VISUAL', colors.yellow, colors.bg2},
  ['V'] = {'V-LINE', colors.yellow, colors.bg2},
  ['c'] = {'COMMAND', colors.orange, colors.bg2},
  ['s'] = {'SELECT', colors.green, colors.bg2},
  ['S'] = {'S-LINE', colors.green, colors.bg2},
  ['t'] = {'TERMINAL', colors.cyan, colors.bg2},
  [''] = {'V-BLOCK', colors.magenta, colors.bg2},
  [''] = {'S-BLOCK', colors.magenta, colors.bg2},
  ['Rv'] = {'VIRTUAL'},
  ['rm'] = {'--MORE'},
}

local sep = {
  right_filled = '', -- e0b2
  left_filled = '', -- e0b0
  right = '', -- e0b3
  left = '', -- e0b1
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
  info = '', -- f05a
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

local function diagnostic_exists()
  return not vim.tbl_isempty(vim.lsp.buf_get_clients(0))
end

local function wide_enough(width)
  local squeeze_width = vim.fn.winwidth(0)
  if squeeze_width > width then return true end
  return false
end

gls.left[1] = {
  ViMode = {
    provider = function()
      local label, fg, nested_fg = unpack(mode_hl())
      highlight('GalaxyViMode', colors.bg1, fg,'bold')
      highlight('GalaxyViModeInv', fg, nested_fg,'bold')
      highlight('GalaxyViModeNested', colors.fg2, nested_fg,'bold')
      highlight('GalaxyViModeInvNested', nested_fg, colors.bg1,'bold')
      highlight('DiffAdd', colors.green, colors.bg1)
      highlight('DiffChange', colors.yellow, colors.bg1)
      highlight('DiffDelete', colors.red, colors.bg1)
      return '  Giangvp99 '
    end,
    separator = sep.left_filled,
    separator_highlight = 'GalaxyViModeInv',
  }
}
gls.left[2] = {
  FileIcon = {
    provider = function()
      local extention = vim.fn.expand('%:e')
      local icon, iconhl = devicons.get_icon(extention)
      if icon == nil then return '' end
      local fg = vim.fn.synIDattr(vim.fn.hlID(iconhl), 'fg')
      local _, _, bg = unpack(mode_hl())
      highlight('GalaxyFileIcon', fg, bg)
      return ' ' .. icon .. ' '
    end,
    condition = buffer_not_empty,
  }
}
gls.left[3] = {
  FileName = {
    provider = function()
      if not buffer_not_empty() then return '' end
      local fname
      if wide_enough(120) then
        fname = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')
      else
        fname = vim.fn.expand '%:t'
      end
      if #fname == 0 then return '' end
      if vim.bo.readonly then fname = fname .. ' ' .. icons.locker end
      if not vim.bo.modifiable then fname = fname .. ' ' .. icons.not_modifiable end
      if vim.bo.modified then fname = fname .. ' ' .. icons.pencil end
      return ' ' .. fname .. ' '
    end,
    highlight = 'GalaxyViModeNested',
    condition = buffer_not_empty,
  }
}
gls.left[4] = {
  LeftSep = {
    provider = function() return sep.left_filled end,
    highlight = 'GalaxyViModeInvNested',
  }
}
gls.left[5] = {
  Paste = {
    provider = function()
      if vim.o.paste then return 'Paste ' end
      return ''
    end,
    icon = '   ',
    highlight = {colors.bright_red, colors.bg1},
  }
}

function check_git_workspace()
  if vim.bo.buftype == 'terminal' then return false end
  local current_file = vim.fn.expand('%:p')
  local current_dir
  -- if file is a symlinks
  if vim.fn.getftype(current_file) == 'link' then
    local real_file = vim.fn.resolve(current_file)
    current_dir = vim.fn.fnamemodify(real_file,':h')
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
      return ' '
    end,
    condition = check_git_workspace,
    highlight = {colors.bright_red, colors.bg1},
  }
}
gls.left[7] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = check_git_workspace,
    highlight = {colors.fg2, colors.bg1},
  }
}
gls.left[8] = {
  Space = {
    provider = function() return ' ' end,
    highlight = {colors.fg2, colors.bg1}
  }
}
gls.left[9] = {
  DiffAdd = {
    provider = 'DiffAdd',
    icon = '  ',
    highlight = {colors.bright_green, colors.bg1},
  }
}
gls.left[10] = {
  DiffModified = {
    provider = 'DiffModified',
    icon = ' ',
    highlight = {colors.bright_orange, colors.bg1},
  }
}
gls.left[11] = {
  DiffRemove = {
    provider = 'DiffRemove',
    icon = '  ',
    highlight = {colors.bright_red, colors.bg1},
  }
}

-- gls.right[1] = {
  --   CocStatus = {
    --     provider = function ()
      --       if not buffer_not_empty() or not wide_enough(110) then return '' end
      --       return '  ' .. vim.fn['coc#status']()
      --     end,
      --     highlight = {colors.fg2, colors.bg1},
      --   }
      -- }
      -- gls.right[2] = {
        --   LspStatus = {
          --     provider = function()
            --       local connected = diagnostic_exists()
            --       if connected then
            --         return '  ' .. icons.connected .. '  '
            --       else
            --         return ''
            --       end
            --     end,
            --     highlight = {colors.bright_green, colors.bg1},
            --   }
            -- }
            gls.right[3] = {
              DiagnosticWarn = {
                provider = 'DiagnosticWarn',
                icon = '  ',
                highlight = {colors.bright_yellow, colors.bg1},
              }
            }
            gls.right[4] = {
              DiagnosticError = {
                provider = 'DiagnosticError',
                icon = '  ',
                highlight = {colors.bright_red, colors.bg1},
              }
            }
            gls.right[3] = {
              DiagnosticHint = {
                provider = 'DiagnosticHint',
                icon = '  ',
                highlight = {colors.bright_blue, colors.bg1}
              }
            }

            gls.right[4] = {
              DiagnosticInfo = {
                provider = 'DiagnosticInfo',
                icon = '  ',
                highlight = {colors.bright_blue, colors.bg1}
              }
            }
            gls.right[5] = {
              RightSepNested = {
                provider = function() return sep.right_filled end,
                highlight = 'GalaxyViModeInvNested',
              }
            }
            gls.right[6] = {
              FileFormat = {
                provider = function()
                  if not buffer_not_empty() or not wide_enough(70) then return '' end
                  local icon = icons[vim.bo.fileformat] or ''
                  return string.format('  %s %s ', icon, vim.bo.fileencoding)
                end,
                highlight = 'GalaxyViModeNested',
              }
            }
            gls.right[7] = {
              RightSep = {
                provider = function() return sep.right_filled end,
                highlight = 'GalaxyViModeInv',
              }
            }
            gls.right[8] = {
              PositionInfo = {
                provider = function()
                  if not buffer_not_empty() or not wide_enough(60) then return '' end
                  return string.format('  %s %s:%s ', icons.line_number, vim.fn.line('.'), vim.fn.col('.'))
                end,
                highlight = 'GalaxyViMode',
              }
            }
            gls.right[9] = {
              PercentInfo = {
                provider = function ()
                  if not buffer_not_empty() or not wide_enough(65) then return '' end
                  local percent = math.floor(100 * vim.fn.line('.') / vim.fn.line('$'))
                  return string.format(' %s %s%s', icons.page, percent, '% ')
                end,
                highlight = 'GalaxyViMode',
                separator = sep.right,
                separator_highlight = 'GalaxyViMode',
              }
            }

            local short_map = {
              ['vim-plug'] = 'Plugins',
              ['coc-explorer'] = 'Explorer',
              ['startify'] = 'Starfity',
              ['tagbar'] = 'Tagbar',
              ['Mundo'] = 'History',
              ['MundoDiff'] = 'Diff',
            }

            function has_file_type()
              local f_type = vim.bo.filetype
              if not f_type or f_type == '' then
                return false
              end
              return true
            end

            gls.short_line_left[1] = {
              BufferType = {
                provider = function ()
                  local label, fg, nested_fg = unpack(mode_hl())
                  highlight('GalaxyViMode', colors.bg1, colors.fg2)
                  highlight('GalaxyViModeInv', colors.fg2, colors.bg1)
                  highlight('GalaxyViModeInvNested', colors.fg2, colors.bg1)
                  local name = short_map[vim.bo.filetype] or 'Editor'
                  return string.format('  %s ', name)
                end,
                highlight = 'GalaxyViMode',
                condition = has_file_type,
                separator = sep.left_filled,
                separator_highlight = 'GalaxyViModeInv',
              }
            }
