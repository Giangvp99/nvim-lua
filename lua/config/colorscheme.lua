vim.cmd([[
try
  colorscheme nvcode 
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry]])
