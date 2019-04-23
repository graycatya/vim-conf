"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
Plugin 'Valloric/YouCompleteMe'
Plugin 'jonathanfilip/vim-lucius'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置当文件被改动时自动载入"
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
if v:version >= 700
    set completeopt=menu,longest  "自动补全Ctrl+p时的一些选项：多于一项时显示菜单，最长选择，显示当前选择的额外信息
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

"YouCompleteMe
let g:ycm_global_ycm_extra_conf='/home/cat/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"设置语法颜色"
"
"colorscheme elflordi
colorscheme desert
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set c/c++ include
set path=/usr/include,/usr/local/include 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""for SourceExplorer plugin""""""""""""""""""""""""".
"{
" // The switch of the Source Explorer 
"nmap se :SrcExplToggle<CR>


" // Set the height of Source Explorer window 
"let g:SrcExpl_winHeight = 6 


" // Set 100 ms for refreshing the Source Explorer 
"let g:SrcExpl_refreshTime = 100 


" // Set "Enter" key to jump into the exact definition context 
"let g:SrcExpl_jumpKey = "<ENTER>" 


" // Set "Space" key for back from the definition context 
"let g:SrcExpl_gobackKey = "<SPACE>" 


" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
"let g:SrcExpl_pluginList = [ 
"        \ "__Tag_List__", 
"        \ "_NERD_tree_" ,
"		\ "Source_Explorer"
"    \ ] 


" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
"let g:SrcExpl_searchLocalDef = 1 


" // Do not let the Source Explorer update the tags file when opening 
"let g:SrcExpl_isUpdateTags = 0 


" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update the tags file 
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 


" // Set "<F6>" key for updating the tags file artificially 
"let g:SrcExpl_updateTagsKey = "<F6>" 


" // Set "<F7>" key for displaying the previous definition in the jump list 
"let g:SrcExpl_prevDefKey = "<F7>" 


" // Set "<F9>" key for displaying the next definition in the jump list 
"let g:SrcExpl_nextDefKey = "<F9>" 
"}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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

"让vimrc配置变更立即生效"
autocmd BufWritePost $MYVIMRC source $MYVIMRC


