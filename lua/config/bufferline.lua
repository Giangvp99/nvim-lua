-- require('bufferline').setup {
--     options = {
--         numbers = "none",
--         -- NOTE: this plugin is designed with this icon in mind,
--         -- and so changing this is NOT recommended, this is intended
--         -- as an escape hatch for people who cannot bear it for whatever reason
--         -- indicator_icon = '▎',
--         -- buffer_close_icon = '',
--         modified_icon = '●',
--         -- close_icon = '',
--         left_trunc_marker = '',
--         right_trunc_marker = '',
--         -- max_name_length = 20,
--         -- max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
--         tab_size = 20,
--         -- diagnostics = "nvim_lsp",
--         -- diagnostics_indicator = function(count, level, diagnostics_dict)
--         --     local icon = level:match("error") and " " or " "
--         --     return " " .. icon .. count
--         -- end,
--         -- NOTE: this will be called a lot so don't do any heavy processing here
--         custom_filter = function(buf_number)
--             -- filter out filetypes you don't want to see
--             if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then return true end
--             -- filter out by buffer name
--             if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then return true end
--             -- filter out based on arbitrary rules
--             -- e.g. filter out vim wiki buffer from tabline in your work repo
--             if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then return true end
--         end,
--         offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
--         show_buffer_icons = true, -- disable filetype icons for buffers
--         show_buffer_close_icons = false,
--         show_close_icon = false,
--         show_tab_indicators = false,
--         persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
--         -- can also be a table containing 2 custom separators
--         -- [focused and unfocused]. eg: { '|', '|' }
--         separator_style = "thick", -- "thin", "slant"
--         enforce_regular_tabs = true,
--         always_show_bufferline = true,
--         sort_by = 'directory'
--     }
-- }
local colors = {
    white = "#F8F8F2",
    darker_black = "#232531",
    black = "#282A36", --  nvim bg
    black2 = "#303341",
    one_bg = "#373844", -- real bg of onedark
    one_bg2 = "#44475a",
    one_bg3 = "#565761",
    grey = "#41434f",
    grey_fg = "#5a5c68",
    grey_fg2 = "#5a5c68",
    light_grey = "#636571",
    red = "#E95678",
    baby_pink = "#DE8C92",
    pink = "#FF79C6",
    line = "#373844", -- for lines like vertsplit
    green = "#69ff94",
    vibrant_green = "#69FF94",
    nord_blue = "#b389ef",
    blue = "#BD93F9",
    yellow = "#F1FA8C",
    sun = "#FFFFA5",
    purple = "#BD93F9",
    dark_purple = "#BD93F9",
    teal = "#0088cc",
    orange = "#FFB86C",
    cyan = "#8BE9FD",
    statusline_bg = "#2b2d39",
    lightbg = "#343642",
    lightbg2 = "#2f313d",
    pmenu_bg = "#b389ef",
    folder_bg = "#BD93F9"
}

local present, bufferline = pcall(require, "bufferline")
if not present then return end

-- function executed for top right close button in bufferline
-- vim.cmd "function! NvChad_bufferline_quitvim(a,b,c,d) \n qa \n endfunction"

bufferline.setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "", padding = 1}},
        indicator_icon = "",
        modified_icon = "",
        -- close_icon = "%@NvChad_bufferline_quitvim@%X",
        show_close_icon = false,
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 15,
        max_prefix_length = 12,
        tab_size = 15,
        show_tab_indicators = false,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = false,
        show_buffer_icons = false, -- disable filetype icons for buffers
        separator_style = "thin",
        always_show_bufferline = true,
        diagnostics = false, -- "or nvim_lsp"
        name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
            -- remove extension from markdown files for example
            -- if buf.name:match('%.md') then return vim.fn.fnamemodify(buf.name, ':p') end
            return vim.fn.fnamemodify(buf.path, ':t:r')
        end,
        custom_filter = function(buf_number)
            -- Func to filter out our managed/persistent split terms
            local present_type, type = pcall(function()
                return vim.api.nvim_buf_get_var(buf_number, "term_type")
            end)

            if present_type then
                if type == "vert" then
                    return false
                elseif type == "hori" then
                    return false
                else
                    return true
                end
            else
                return true
            end
        end
    },
    highlights = {
        background = {guifg = colors.grey_fg, guibg = colors.black2},

        -- buffers
        buffer_selected = {guifg = colors.white, guibg = colors.black2}, -- , gui = "bold"
        buffer_visible = {guifg = colors.light_grey, guibg = colors.black2},

        -- duplicate
        duplicate = {guifg = colors.red, guibg = colors.black2},
        duplicate_selected = {guifg = colors.red, guibg = colors.black2},
        duplicate_visible = {guifg = colors.red, guibg = colors.black2},

        fill = {guifg = colors.baby_pink, guibg = colors.black2},
        indicator_selected = {guifg = colors.black, guibg = colors.black},

        -- modified
        modified = {guifg = colors.red, guibg = colors.black2},
        modified_visible = {guifg = colors.red, guibg = colors.black2},
        modified_selected = {guifg = colors.green, guibg = colors.black2},

        -- separators
        separator = {guifg = colors.black2, guibg = colors.black2},
        separator_visible = {guifg = colors.black2, guibg = colors.black2},
        separator_selected = {guifg = colors.black2, guibg = colors.black2},
        -- tabs
        tab = {guifg = colors.red, guibg = colors.one_bg3},
        tab_selected = {guifg = colors.black2, guibg = colors.nord_blue},
        tab_close = {guifg = colors.red, guibg = colors.black2}
    }
}
