vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_section = {
	a = { description = { "  Find File                 SPC s f" }, command = "Telescope find_files" },
	b = { description = { "  Recents                   SPC s r" }, command = "Telescope oldfiles" },
	c = { description = { "  Find Word                 SPC s t" }, command = "Telescope live_grep" },
	-- d = {description = {"  New File                  SPC   "}, command = "DashboardNewFile"},
	e = { description = { "  Bookmarks                 SPC s m" }, command = "Telescope marks" },
	f = { description = { "  Load Last Session         SPC S l" }, command = "SessionLoad" },
}
vim.g.dashboard_custom_footer = { "" }
vim.g.dashboard_custom_header = { "" }
vim.cmd([[
augroup dashboard_au
     autocmd! * <buffer>
     autocmd User dashboardReady let &l:stl = 'Dashboard'
     autocmd User dashboardReady nnoremap <buffer> <leader>q <cmd>exit<CR>
     autocmd User dashboardReady nnoremap <buffer> <leader>u <cmd>PackerUpdate<CR>
     autocmd User dashboardReady nnoremap <buffer> <leader>l <cmd>SessionLoad<CR>
augroup END
]])

vim.g.dashboard_session_directory = "~/.config/nvim/.sessions"
