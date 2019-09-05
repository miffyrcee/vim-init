let g:neoformat_try_formatprg = 1
let g:neoformat_run_all_formatters = 1
" let g:neoformat_only_msg_on_error = 1
augroup fmt
	autocmd!
	autocmd BufWritePre * undojoin | Neoformat
augroup END

