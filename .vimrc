"set encoding=utf-8

set pyxversion=3

" set nocompatible

let g:python3_host_prog="/usr/bin/python3.6"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-plug'
Plug 'scrooloose/nerdtree'        
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/taglist.vim'
Plug 'brookhong/cscope.vim'
Plug 'mbbill/echofunc'
if has('nvim')
	Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/deoplete-clangx'
Plug 'Shougo/neoinclude.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'octol/vim-cpp-enhanced-highlight'

"Plug 'Valloric/YouCompleteMe'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup=1
" Change clang binary path
call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')

" Change clang options
call deoplete#custom#var('clangx', 'default_c_options', '')
call deoplete#custom#var('clangx', 'default_cpp_options', '')

filetype plugin on
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'

"设置当文件被改动时自动载入"
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
if v:version >= 700
    set completeopt=menu,longest,preview  "自动补全Ctrl+p时的一些选项：多于一项时显示菜单，最长选择，显示当前选择的额外信息
endif 

"设置Tab长度为4空格"
set tabstop=4
"设置自动缩进长度为4空格"
set shiftwidth=4
"继承前一行的缩进方式，适用于多行注释"
set autoindent
"显示括号匹配"
set showmatch

"总是显示状态栏"
set laststatus=2
"显示光标当前位置"
set ruler
"行号"
set number
set nu

set cursorcolumn
set cursorline

"autocmd InsertLeave * se cul  " 用浅色高亮当前行
hi CursorLine   cterm=NONE ctermbg=gray ctermfg=brown
hi CursorColumn cterm=NONE ctermbg=gray ctermfg=brown

colorscheme desert

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let Tlist_Ctags_Cmd='/usr/bin/ctags'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" cscope配置"""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
     "set csprg=/usr/local/bin/cscope
	 set csto=1
     set cst
	 set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
		cs add /usr/include
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
set csverb
endif
"解决ctrl+]只跳转到第一个关键词问题
nnoremap <C-]> :ts <C-R>=expand("<cword>")<CR><CR>
vnoremap <C-]> :ts <C-R>=expand("<cword>")<CR><CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""
"echofun
"""""""""""""""""""""""""""""
"映射,tg执行ctags命令
nmap <silent> ,tg :!ctags -R --fields=+lS<cr><cr>
vmap <silent> ,tg :!ctags -R --fields=+lS<cr><cr>
nmap ,ts :!ctags -Rn --c++-kinds=+p --fields=+ialS --extra=+q -o ~/.vim/systags /usr/include /usr/local/include<cr><cr>
set tags+=~/.vim/systags
set tags+=/usr/include/tags 
set tags+=/usr/local/tags 
"""""""""""""""""""""""""""""


""""""""""""""""""""foDTree目录树插件---配置选项=====================================================        
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeDirArrowExpandable = '▶'  "目录图标                                                                
let g:NERDTreeDirArrowCollapsible = '▼'
" call s:initVariable("g:NERDTreeDirArrowExpandable", "▸")
" call s:initVariable("g:NERDTreeDirArrowCollapsible", "▾")
"autocmd vimenter * NERDTree                "自动打开目录树
""vim【无文件】也显示目录树 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"vim打开目录文件也显示目录树？
"autocmd StdinReadPre * let s:std_in=1 
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&
"!exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene     | endif
""CRTL+m开关目录树
map <C-m> :NERDTreeToggle<CR>
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" " 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let g:NERDTreeNodeDelimiter = 'x'
"关闭最后一个文件，同时关闭目录树
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
"b:NERDTree.isTabTree()) | q | endif
""<-NERDTree目录树插件---配置选项===============================================================

"->taglist浏览插件配置=========================================     
""taglist窗口显示在右侧，缺省为左侧     
let Tlist_Use_Right_Window=1    
"设置ctags路径"将taglist与ctags关联     
let Tlist_Ctags_Cmd = '/usr/bin/ctags'     
""启动vim后自动打开taglist窗口     
let Tlist_Auto_Open = 1     
"不同时显示多个文件的tag，只显示当前文件的     
""不同时显示多个文件的tag，仅显示一个     
let Tlist_Show_One_File = 1     
"taglist为最后一个窗口时，退出vim     
let Tlist_Exit_OnlyWindow = 1     
""let Tlist_Use_Right_Window =1     
"设置taglist窗口大小     
""let Tlist_WinHeight = 100     
"let Tlist_WinWidth = 60     
""设置taglist打开关闭的快捷键CRTL+b     
noremap <C-b> :TlistToggle<CR>     
" 更新ctags标签文件快捷键设置     
noremap <F6> :!ctags -R<CR>    

function! UpdateCtags()
    let curdir=getcwd()
	    while !filereadable("./tags")
		    cd ..
	        if getcwd() == "/"
				break
			endif
		endwhile
	if filewritable("./tags")
		!ctags -R --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q
			TlistUpdate
	endif
	execute ":cd " . curdir
endfunction

nmap <F4> :call UpdateCtags()<CR>
					
""<-taglist========================================= 


"syntastic
""设置error和warning的标志
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='►'
"总是打开Location
"List（相当于QuickFix）窗口，如果你发现syntastic因为与其他插件冲突而经常崩溃，将下面选项置0
"let g:syntastic_always_populate_loc_list = 1
""自动打开Locaton
" List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发现错误时自动关闭，置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭
"let g:syntastic_auto_loc_list = 1
"修改Locaton List窗口高度
"let g:syntastic_loc_list_height = 5
""打开文件时自动进行检查
let g:syntastic_check_on_open = 1
"自动跳转到发现的第一个错误或警告处
"let g:syntastic_auto_jump = 1
""进行实时检查，如果觉得卡顿，将下面的选项置为1
let g:syntastic_check_on_wq = 0
"高亮错误
"let g:syntastic_enable_highlighting=1
""让syntastic支持C++11
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
        exec "!time python3.6 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc


"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

"让vimrc配置变更立即生效"
autocmd BufWritePost $MYVIMRC source $MYVIMRC
