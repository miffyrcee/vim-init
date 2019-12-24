let g:indentline_enabled = 1
let g:indentline_char='┆'
let g:indentLine_fileTypeExclude = ['defx', 'denite','startify','tagbar','vista_kind','vista']
let g:indentLine_concealcursor = 'niv'
let g:indentLine_color_term = 96
let g:indentLine_color_gui= '#725972'
" let g:indentLine_color_gui= '#b0766d'

let g:indentLine_showFirstIndentLevel =1
" let g:indentLine_conceallevel = 0
" let g:indentLine_noConcealCursor=""
autocmd FileType json let g:indentLine_conceallevel = 0
