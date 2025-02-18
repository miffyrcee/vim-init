"======================================================================
"
" init-plugins.vim - 
"
" Created by skywind on 2018/05/31
" Last Modified: 2018/06/10 23:11
"
"======================================================================
" vim: se ts=4 sw=4 tw=78 noet :



"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
	let g:bundle_group = ['basic', 'tags', 'enhanced','coc','language','indentLine','rainbow']
	let g:bundle_group += ['tags','nerdtree', 'echodoc']
	let g:bundle_group += ['leaderf','neofomart','buffet']
endif


"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
function! s:path(path)
	let path = expand(s:home . '/' . a:path )
	return substitute(path, '\\', '/', 'g')
endfunc


"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))


"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0
	Plug 'ryanoasis/vim-devicons'
	let g:webdevicons_enable_denite = 1
	Plug 'taigacute/spaceline.vim'
	let g:spaceline_seperate_style= 'curve'
	Plug 'junegunn/vim-easy-align'
	xmap ga <Plug>(EasyAlign)
	nmap ga <Plug>(EasyAlign)
	" Plug 'majutsushi/tagbar'
	" Plug 'chrisbra/vim-diff-enhanced'
	Plug 'skywind3000/asyncrun.vim'
	Plug 'mhinz/vim-startify'
	let g:startify_disable_at_vimenter = 1
	let g:startify_session_dir = '~/.vim/session'
	" Plug 'flazz/vim-colorschemes'
	Plug 'xolox/vim-misc'
	" 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
	Plug 'kshenoy/vim-signature'
	" 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
	" 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
	Plug 'mh21/errormarker.vim'
	noremap <silent><space>ha :RemoveErrorMarkers<cr>
	" 使用 ALT+e 会在不同窗口/标签上显示 A/B/C 等编号，然后字母直接跳转
	Plug 't9md/vim-choosewin'
	" 使用 ALT+E 来选择窗口
	nmap <m-e> <Plug>(choosewin)

	" 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
	Plug 'skywind3000/vim-preview'
	" 使用 <space>ha 清除 errormarker 标注的错误
	" Plug 'tmhedberg/SimpylFold',{'for':'python'}
	Plug 'numirias/semshi',{'for':'python'}
	let g:semshi#excluded_buffer=['*']
	" Plug 'sheerun/vim-polyglot',{'for':'python'}
	Plug 'Yggdroot/indentLine'
	Plug 'luochen1990/rainbow'
	Plug 'sbdchd/neoformat'
	Plug 'Yggdroot/LeaderF'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'iamcco/markdown-preview.vim'
	Plug 'AndrewRadev/sideways.vim'
	Plug 'rhysd/accelerated-jk'
	nmap j <Plug>(accelerated_jk_gj)
	nmap k <Plug>(accelerated_jk_gk)
	Plug 'airblade/vim-rooter'
	let g:rooter_change_directory_for_non_project_files = 'home'
	let g:rooter_patterns = ['Rakefile', '.git/']
	Plug 'junegunn/vim-peekaboo'
	Plug 'mbbill/undotree'
	if has("persistent_undo")
		set undodir=$HOME/.cache/undog.log
		set undofile
	endif
	nnoremap <leader>r :UndotreeToggel<cr>
	" Plug 'nelstrom/vim-visual-star-search'
	Plug 'vim-python/python-syntax'
	let g:python_highlight_all = 1

endif
"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhanced') >= 0

	" 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
	Plug 'terryma/vim-expand-region'
	"添加外括号
	Plug 'tpope/vim-surround'
	"iw跳转
	Plug 'wellle/targets.vim'
	autocmd User targets#mappings#user call targets#mappings#extend({
	\ ' ': {'separator': [{'d': ' '}]},
    \ })
	" .重复
	Plug 'tpope/vim-repeat'
	silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
	" ALT_+/- 用于按分隔符扩大缩小 v 选区
	map <m-=> <Plug>(expand_region_expand)
	map <m--> <Plug>(expand_region_shrink)

	Plug 'jvanja/vim-bootstrap4-snippets'
	Plug 'junegunn/fzf'
	Plug 'liuchengxu/vista.vim'
	" nnoremap <silent><localleader>fv :Vista!!<CR>
	nnoremap <silent><leader>v :Vista coc<CR>
	Plug 'KabbAmine/zeavim.vim'
	nmap <silent><m-f> <esc>viw<Plug>ZVVisSelection
	nmap <leader>d <esc>:Docset 

endif
"----------------------------------------------------------------------
" 自动生成 ctags/gtags，并提供自动索引功能
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
" 详细用法见：https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------
if index(g:bundle_group, 'tags') >= 0
	" 提供 ctags/gtags 后台数据库自动更新功能
	Plug 'ludovicchabant/vim-gutentags'
	" 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
	" 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
	Plug 'skywind3000/gutentags_plus'
endif
"----------------------------------------------------------------------
" buffet
"----------------------------------------------------------------------
inoremap <silent> <m-r> <esc>:bp<cr>
"conceallevel----------------------------------------------------------------------
" echodoc：搭配 YCM/deoplete 在底部显示函数参数
"----------------------------------------------------------------------
if index(g:bundle_group, 'echodoc') >= 0
	Plug 'Shougo/echodoc.vim'
	set noshowmode
	let g:echodoc#enable_at_startup = 1
	Plug 'bagrat/vim-buffet'
	noremap <silent> <m-r> :bp<cr>
endif

for f in split(glob('$HOME/.vim/vim-init/core/plugins/*'),'\n')
	execute 'source' f
endfor
"----------------------------------------------------------------------
"
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()
