"======================================================================
"
" init-style.vim - 显示样式设置
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 20:29:07
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" 显示设置
"----------------------------------------------------------------------

" 总是显示状态栏
set laststatus=2

" 总是显示行号
set number

" 总是显示侧边栏（用于显示 mark/gitdiff/诊断信息）
set signcolumn=yes

" 总是显示标签栏
set showtabline=2

" 设置显示制表符等隐藏字符
set list

" 右下角显示命令
set showcmd

" 插入模式在状态栏下面显示 -- INSERT --，
" 先注释掉，默认已经为真了，如果这里再设置一遍会影响 echodoc 插件
" set showmode

" 水平切割窗口时，默认在右边显示新窗口
set splitright


"----------------------------------------------------------------------
" 颜色主题：色彩文件位于 colors 目录中
"----------------------------------------------------------------------

" 设置黑色背景
set background=dark

" 允许 256 色
set t_Co=256

" 设置颜色主题，会在所有 runtimepaths 的 colors 目录寻找同名配置
color gruvbox

" Vim Colors
" ---------------------------------------------------------
hi Whitespace ctermfg=96 guifg=#725972 guibg=NONE ctermbg=NONE
hi VertSplit  ctermfg=Black  guifg=Black
"hi Normal guibg=NONE ctermbg=NONE
"hi LineNr ctermbg=NONE guibg=NONE
hi SignColumn ctermfg=187 ctermbg=NONE guifg=#ebdbb2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
highlight! link pythonSpaceError  NONE
highlight! link pythonIndentError NONE
" highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931

"Pmenu Colors
" ---------------------------------------------------------
hi PMenuSel ctermfg=252 ctermbg=106 guifg=#d0d0d0 guibg=#859900 guisp=#859900 cterm=NONE gui=NONE

"coc setting
" ---------------------------------------------------------
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
hi default CocHighlightText  guibg=#725972 ctermbg=96
hi CocWarningSign  ctermfg=32 ctermbg=NONE guifg=#0087d7 guibg=NONE


"GitGutter Coc-git Highlight
" ---------------------------------------------------------
highlight GitGutterAdd ctermfg=22 guifg=#006000 ctermbg=NONE guibg=NONE
highlight GitGutterChange ctermfg=58 guifg=#5F6000 ctermbg=NONE guibg=NONE
highlight GitGutterDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE
highlight GitGutterChangeDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE

" Defx Highlight
" ---------------------------------------------------------
highlight Defx_filename_3_Modified  ctermfg=1  guifg=#D370A3
highlight Defx_filename_3_Staged    ctermfg=10 guifg=#A3D572
highlight Defx_filename_3_Ignored   ctermfg=8  guifg=#404660
highlight def link Defx_filename_3_Untracked Comment
highlight def link Defx_filename_3_Unknown Comment
highlight def link Defx_filename_3_Renamed Title
highlight def link Defx_filename_3_Unmerged Label
" highlight Defx_git_Deleted   ctermfg=13 guifg=#b294bb

" buftabline highlight
" ---------------------------------------------------------
highlight BufTabLineCurrent ctermbg=96 guibg=#5d4d7a

" buftabline highlight
" ---------------------------------------------------------
highlight  gitInfoRepotitle    guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitInfoHeadtitle   guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitInfoUpstreamtitle  guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitInfoPushtitle   guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitCommitModetitle  guibg=NONE guisp=NONE gui=bold cterm=bold

highlight  gitSectionsStaged guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsUnstaged guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsCommitMsg guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsCommitStash  guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsRecentCommit guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold

"GetColorSynatxGroup
" ---------------------------------------------------------
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

augroup MyAutoCmd

    	" Reload vim config automatically
    autocmd BufWritePost $VIM_PATH/{*.vim,*.yaml,vimrc} nested
		\ source $MYVIMRC | redraw

	autocmd WinEnter,InsertLeave * set cursorline

	autocmd WinLeave,InsertEnter * set nocursorline

    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

	autocmd Syntax * if 5000 < line('$') | syntax sync minlines=200 | endif

    autocmd FileType css setlocal equalprg=csstidy\ -\ --silent=true

    autocmd BufWritePre *.js,*.jsx,*.less,*.css,*.html Neoformat

    autocmd FileType json syntax match Comment +\/\/.\+$+

    " Go (Google)
    autocmd FileType go let b:coc_pairs_disabled = ['<']

    " HTML (.gohtml and .tpl for server side)
    autocmd BufNewFile,BufRead *.html,*.htm,*.gohtml,*.tpl  setf html
    " Magit
     autocmd User VimagitEnterCommit startinsert

	" https://webpack.github.io/docs/webpack-dev-server.html#working-with-editors-ides-supporting-safe-write
	autocmd FileType css,javascript,jsx,javascript.jsx setlocal backupcopy=yes
augroup END
