local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end
local status_gps_ok, gps = pcall(require, "nvim-gps")
if not status_gps_ok then
	return
end
local colors = {
	bg = "#202328",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 100
	end,
	buffer_not_empty_and_hide_in_width = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 and vim.fn.winwidth(0) > 100
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
		disabled_filetypes = { "NvimTree", "Dashboard", "vista", "startify", "packer" },
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				function()
					-- auto change color according to neovims mode
					local mode_color = {
						n = colors.red,
						i = colors.green,
						v = colors.blue,
						[""] = colors.blue,
						V = colors.blue,
						c = colors.magenta,
						no = colors.red,
						s = colors.orange,
						S = colors.orange,
						[""] = colors.orange,
						ic = colors.yellow,
						R = colors.violet,
						Rv = colors.violet,
						cv = colors.red,
						ce = colors.red,
						r = colors.cyan,
						rm = colors.cyan,
						["r?"] = colors.cyan,
						["!"] = colors.red,
						t = colors.red,
					}
					vim.api.nvim_command(
						"hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg
					)
					return " "
				end,
				color = "LualineMode",
				padding = { right = 1 },
			},
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " " },
				diagnostics_color = {
					color_error = { fg = colors.red },
					color_warn = { fg = colors.yellow },
					color_info = { fg = colors.cyan },
				},
			},
			{ "branch", icon = "", color = { fg = colors.violet, gui = "bold" } },
			{
				"diff",
				-- Is it me or the symbol for modified us really weird
				symbols = { added = " ", modified = "柳 ", removed = " " },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.orange },
					removed = { fg = colors.red },
				},
				cond = conditions.hide_in_width,
			},
			{
				function()
					return gps.get_location()
				end,
				cond = gps.is_available,
			},
		},
		lualine_x = {
			{
				function()
					return "%="
				end,
			},
			{

				-- Lsp server name .
				function()
					local msg = "No Active Lsp"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if client.name ~= "null-ls" and filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end
					return msg
				end,
				icon = " LSP:",
				color = { fg = colors.cyan, gui = "bold" },
				cond = conditions.hide_in_width,
			},
			{
				"filename",
				cond = conditions.buffer_not_empty_and_hide_in_width,
				path = 1,
				color = { fg = colors.magenta, gui = "bold" },
			},
			{
				"o:encoding", -- option component same as &encoding in viml
				fmt = string.upper, -- I'm not sure why it's upper case either ;)
				cond = conditions.hide_in_width,
				color = { fg = colors.green, gui = "bold" },
			},
			{
				"fileformat",
				fmt = string.upper,
				icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
				color = { fg = colors.green, gui = "bold" },
				cond = conditions.hide_in_width,
			},
			{ "progress", color = { fg = colors.fg, gui = "bold" } },
			{ "location" },
			{ "filesize", cond = conditions.buffer_not_empty_and_hide_in_width },
		},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_v = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {
			{
				"filename",
				cond = conditions.buffer_not_empty,
				path = 1,
				color = { fg = colors.magenta, gui = "bold" },
			},
		},
	},
}

lualine.setup(config)
