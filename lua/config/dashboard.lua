vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_header = {""}
vim.g.dashboard_custom_footer = {"Giangvp99"}
vim.g.dashboard_custom_section = {
    a = {description = {'Recently Used Files'}, command = 'Telescope oldfiles'},
    b = {description = {' Load Last Session '}, command = 'SessionLoad'},
    c = {description = {'     Find File     '}, command = 'Telescope find_files'}
}
