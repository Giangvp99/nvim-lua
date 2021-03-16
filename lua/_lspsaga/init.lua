local saga = require 'lspsaga'
saga.init_lsp_saga()

-- show hover doc
--nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
-- or use command
--nnoremap <silent>K :Lspsaga hover_doc<CR>

-- scroll down hover doc or scroll in definition preview
--nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
-- scroll up hover doc
--nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
