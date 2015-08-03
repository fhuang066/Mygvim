set nocompatible
"=====================================编码=============================
set encoding=utf8
set fileencoding=utf8
"set termencoding=utf8
set fencs=ucs-bom,utf8,utf16le,chinese,prc,cp936,gb18030,gb2312,utf-16,big5,euc-jp,euc-kr,latin1
set fileencodings=ucs-bom,utf8,utf16le,chinese,prc,cp936,gb18030,gb2312,utf16,big5,euc-jp,euc-kr,latin1
" -----------------------------------------------------------------------------
"中文帮助文档设置
set helplang=cn
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
language messages zh_CN.utf-8
" -----------------------------------------------------------------------------

set diffexpr=MyDiff()
function MyDiff()
let opt = '-a --binary '
if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
let arg1 = v:fname_in
if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
let arg2 = v:fname_new
if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
let arg3 = v:fname_out
if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
let eq = ''
if $VIMRUNTIME =~ ' '
 if &sh =~ '\<cmd'
   let cmd = '""' . $VIMRUNTIME . '\diff"'
   let eq = '"'
 else
   let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
 endif
else
 let cmd = $VIMRUNTIME . '\diff'
endif
silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
"上面是gvim的默认设置，可以正常的在window下正常使用

"============判断操作系统是否是 Windows 还是 Linux====================
" -----------------------------------------------------------------------------
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
 let g:iswindows = 1
else
 let g:islinux = 1
endif
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
 let g:isGUI = 1
else
 let g:isGUI = 0
endif



"==============================Vundle配置========================================
set nocompatible " be iMproved
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" -----------------------------------------------------------------------------
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" **********************My Bundles here:****************************************
" -----------------------------------------------------------------------------
" vim-scripts repos
" -----------------------------------------------------------------------------
" Syntax
Bundle 'asciidoc.vim'
Bundle 'confluencewiki.vim'
Bundle 'html5.vim'
Bundle 'JavaScript-syntax'
" -----------------------------------------------------------------------------
"Bundle 'mako.vim'
Bundle 'moin.vim'
Bundle 'python.vim--Vasiliev'
Bundle 'xml.vim'
" -----------------------------------------------------------------------------
" Color
Bundle 'desert256.vim'
Bundle 'Impact'
Bundle 'matrix.vim'
Bundle 'vibrantink'
Bundle 'vividchalk.vim'
"Bundle 'flazz/vim-colorschemes'
Bundle 'upsuper/vim-colorschemes'
Bundle 'altercation/solarized'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'tomasr/molokai'
" -----------------------------------------------------------------------------
"statusline状态栏
"Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'
"Bundle 'powerline/fonts'
"Bundle 'eugeneching/consolas-powerline-vim'
"solarized
"Bundle 'Lokaltog/vim-powerline'
" -----------------------------------------------------------------------------
" Ftplugin
Bundle 'python_fold'
" -----------------------------------------------------------------------------
" Indent
" -----------------------------------------------------------------------------
" Plugin
Bundle 'The-NERD-tree'
Bundle 'fhuang066/taglist'
Bundle 'Yggdroot/indentLine'
Bundle 'fhuang066/TxtBrowser'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'vim-scripts/VisIncr'
Bundle 'vim-scripts/vimwiki'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'sjas/csExplorer'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/mru.vim'
Bundle 'othree/eregex.vim'
"Bundle 'vim-scripts/TaskList.vim'
"Bundle 'vim-scripts/gtd'
Bundle 'fhuang066/vimim'

" -----------------------------------------------------------------------------
"doc
Bundle 'asins/vimcdoc'
" -----------------------------------------------------------------------------
"au VimEnter * BundleInstall



"================================Gvim的个性化及外观等配置===========================================
set shortmess=atI
"------------------------------------------------------
" 当.vimrc被修改时，重载之
autocmd! bufwritepost vimrc source "d:/Vim/_vimrc"
hi Comment guifg=Blue
"------------------------------------------------------
"GVim的配色方案,可以完全根据自己的审美观修改哦.^_^.
"colorscheme solarized
"set background=dark
"set background=light
"ColorSchemeExplorer
colorscheme desert
"colorscheme molokai
"colorscheme Tomorrow-Night

"------------------------------------------------------
"开启高亮光标列
set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred
highlight Keyword term=reverse,bold
"------------------------------------------------------
"高亮注释行
au ColorScheme * hi Comment guifg=yellow
au ColorScheme * hi Comment guibg=brown
highlight Comment cterm=underline ctermfg=red ctermbg=blue
"其中Cursorline和CursorColumn分别表示光标所在的行和列
"highlight Comment cterm=underline ctermfg=red ctermbg=blue
"gui，可以使用选项gui=attribute，来定义图形窗口下语法元素的显示属性。选项guifg和guibg，用来定义了前景色和背景色。推荐使 用的颜色包括：black, brown, grey, blue, green, cyan, magenta, yellow, white。
"------------------------------------------------------
"高亮行号
"highlight LineNr guifg=Grey
au ColorScheme * hi LineNr guifg=#A4E57E
"------------------------------------------------------
"行号
set nu!
"------------------------------------------------------------------------------
"高亮光标所在行
set cul
"------------------------------------------------------
"字体
"set guifont=Bitstream_Vera_Sans_Mono:h21
"set guifont=Consolas_for_Powerline_FiexdD:h21,Consolas:h21
set guifont=Consolas_for_Powerline_FixedD:h20
set gfw=Yahei_Mono:h18
"set gfw=Consolas_for_Powerline_FixedD:h18,Yahei_Mono:h21
"set guifont=Liberation_Mono_for_Powerline:h10
"set guifont=PowerlineSymbols:h21
"------------------------------------------------------
set linespace=1 "两行的间距, 只对gvim有效
"------------------------------------------------------
" Sets how many lines of history VIM has to remember
set history=700
"------------------------------------------------------
"启动时全屏
autocmd GUIEnter * simalt ~x
"------------------------------------------------------
"powerline状态栏
set laststatus=2
set t_Co=256   
if !exists('g:airline_symbols')
 let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline_left_sep = '⮀ ⭠'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = ' ⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭠'


"2015年7月注释,powerline,修改方向为airline
"set laststatus=2
" set nocompatible
" set t_Co=256
"let g:Powerline_cache_dir = simplify(expand('<sfile>:p:h') .'/..')
"let g:Powerline_cache_enabled = 0
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_colorscheme = 'solarized16'
"let g:Powerline_theme = 'default'
"let g:Powerline_symbols_override = {
"        \ 'BRANCH': [0x2213],
"        \ 'LINE': 'L',
"        \ }
"let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
"let g:Powerline_mode_n = 'NORMAL'
"let g:Powerline_stl_path_style = 'full'
" -----------------------------------------------------------------------------
"  < vimtweak 工具配置 > 请确保以已装了工具
" 这里只用于窗口透明与置顶，常规模式下 Ctrl + Up（上方向键） 增加不透明度，Ctrl + Down（下方向键） 减少不透明度，<Leader>t 窗口置顶与否切换
if (g:iswindows && g:isGUI)
 let g:Current_Alpha = 255
 let g:Top_Most = 0
 func! Alpha_add()
     let g:Current_Alpha = g:Current_Alpha + 10
     if g:Current_Alpha > 255
         let g:Current_Alpha = 255
     endif
     call libcallnr("vimtweak.dll","SetAlpha",g:Current_Alpha)
 endfunc
 func! Alpha_sub()
     let g:Current_Alpha = g:Current_Alpha - 10
     if g:Current_Alpha < 155
         let g:Current_Alpha = 155        
		endif
     call libcallnr("vimtweak.dll","SetAlpha",g:Current_Alpha)
 endfunc
 func! Top_window()
     if  g:Top_Most == 0
         call libcallnr("vimtweak.dll","EnableTopMost",1)
         let g:Top_Most = 1
     elseif
         call libcallnr("vimtweak.dll","EnableTopMost",0)
         let g:Top_Most = 0
     endif
 endfunc
endif
" -----------------------------------------------------------------------------
"高亮缩进线
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_guide_size=1
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4 
:set list lcs=tab:\|\ 
let g:indentLine_color_gui = '#A4E57E'
hi ColorColumn ctermbg=darkgrey guibg='#A4E57E'
function! SetColorColumn()
 let col_num = virtcol(".")
 let cc_list = split(&cc, ',')
 if count(cc_list, string(col_num)) <= 0
     execute "set cc+=".col_num
 else
     execute "set cc-=".col_num
 endif
endfunction
" -----------------------------------------------------------------------------
"设置缩进数
set tabstop=4
set shiftwidth=4
set autoindent
" -----------------------------------------------------------------------------
" 解决中文错位
set ambiwidth=double
set autowrite
"------------------------------------------------------
"禁止生成备份和交换文件
set noswapfile
set nobackup	
set backupcopy=yes
"------------------------------------------------------
"Toggle Menu and Toolbar
set go= 
"set guioptions-=m
"set guioptions-=T
map <silent> <F8> :if &guioptions =~# 'T' <Bar>
     \set guioptions-=T <Bar>
     \set guioptions-=m <bar>
 \else <Bar>
     \set guioptions+=T <Bar>
     \set guioptions+=m <Bar>
 \endif<CR>
""set guioptions-=m       " 隐藏菜单栏
""set guioptions-=T        " 隐藏工具栏
"set guioptions-=L       " 隐藏左侧滚动条
"set guioptions-=r       " 隐藏右侧滚动条
"set guioptions-=b       " 隐藏底部滚动条
"set showtabline=0       " 隐藏Tab栏
"==========================目录树============================
"------------------------------------------------------
"指定ctags位置
let Tlist_Ctags_Cmd = 'd:/Vim/vim74/ctags.exe'
"let Tlist_Ctags_Cmd = 'd:/ctags.exe'
"------------------------------------------------------
"tags设置
set tags+=tags;
set autochdir 
"------------------------------------------------------
"txtbrower设置
syntax on
filetype plugin on
au BufEnter *.txt setlocal ft=txt
au BufRead,BufNewFile *.* setlocal ft=txt
let tlist_txt_settings = 'txt;c:content;f:figures;t:tables'
"------------------------------------------------------
"打开语法高亮,文件类型检测等
filetype on
filetype plugin on
filetype indent on

"文件折叠设置
set foldmethod=indent
set foldcolumn=4
"================================ 储存文件夹设置 ==============================
"文件自动保存目录
:cd f:\01@huancunqi\
" Add GTD menu.
"输入法设置
let g:vimim_shuangpin='flypy'	" 双拼：小鹤
let g:vimim_punctuation=0	" 常用中文标点
"=========================兴趣====================
" NERD tree左窗口
"let NERDChristmasTree=0
"let NERDTreeWinSize=18
"let NERDTreeChDirMode=2
"let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"let NERDTreeShowBookmarks=1
"let NERDTreeWinPos="left"
"" Automatically open a NERDTree if no files where specified
"autocmd vimenter * if !argc() | NERDTree | endif
"" Close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"" Tagbar右窗口
"let g:tagbar_width=45
"let g:tagbar_autofocus=1
"nmap <F6> :TagbarToggle<CR>
"" ctrap下窗口包含了两个部分：一个是用于全局搜索的窗口和一个状态条。
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"================================ 快捷键设置 ============================================
"------------------------------------------------------
" 设置mapleader
let mapleader = "["
let g:mapleader = "["
"------------------------------------------------------
"透明度快捷键
map <c-up> :call Alpha_add()<CR>
map <c-down> :call Alpha_sub()<CR>
"map <leader>r :call Top_window()<CR>
"------------------------------------------------------
"tab快捷键设置
if has("gui_running")
     noremap <M-1> 1gt
     noremap <M-2> 2gt
     noremap <M-3> 3gt
     noremap <M-4> 4gt
     noremap <M-5> 5gt
     noremap <M-6> 6gt
     noremap <M-7> 7gt
     noremap <M-8> 8gt
     noremap <M-9> 9gt
     noremap <M-0> 10gt
endif
"------------------------------------------------------
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> <C-F>
map <c-space> /
"------------------------------------------------------
"其他快捷键映射
map ,f :call SetColorColumn()<CR>"标尺线快捷键设置
nmap tt :g/^$/d<CR> "删除空行
nmap ,e :%s/^ //g<CR>"删除行首空格
nmap ,E :%s/ $//g<CR>"删除行尾空格
nmap ,c O<Esc>"在项目下面加入空行
nmap ,k :sav 
nmap ,s :%S/
nmap ,te :sort u<CR>
map j gj"映射上下移动时按行内移动的方式
map k gk"映射上下移动时按行内移动的方式
map J gJ
nmap ,g :g/^/exec "s/^/".strpart(line(".")." ", 0, 4)<CR>
nmap zz :wqa<CR>
"快速打开编辑 .vimrc配置文件--->",ee"  
nmap ,bb :e d:/Vim/_vimrc <CR> 
"------------------------------------------------------
"F2-12的快捷键映射
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F3> :Tlist<cr>
imap <F3> <ESC><F3>
nmap <silent> <F4> :TlistUpdate<cr>
vmap <silent> <F4> :I<CR>
nmap <silent> <F5> :split new<CR>
"nmap <silent> <F6> :vsplit new<CR>
nmap <silent> <F7> :!ctags -R %:h<CR>
map <F9> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
nmap <silent> <F10> ZZ
map <F11> <C-E>:sleep 100m<CR>j20<F11>
"               [ map映射说明：]
"<F2>=nedtree
"<F3>=tlist
"<F4>=v模式下编号
"<F5>=横向分割
"<F6>=纵向分割
"<F7>=ctags运行
"<F8>=菜单项
"<F9>=全屏
"<F10>=保存并推出
" <F11>
" <F12>
