vim.opt.listchars = {space = "⋅", eol = "↴"}

require("indent_blankline").setup {
    buftype_exclude = {"terminal"},
    filetype_exclude = {"dashboard"},
    space_char_blankline = " ",
    show_current_context = true
}
