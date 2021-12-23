

" wangting
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""    
" 如果vim插件管理器没有安装则自动安装    
" 如果是vim需要修改路径为： 
"     if empty(glob('~/.vim/autoload/plug.vim'))    
" if empty(glob('~/.config/nvim/autoload/plug.vim'))    
"    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs    
"      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim    
"    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC    
"  endif



"""""""""""""""""""""""""""""""""" 基本配置
" 行号
set nu

" 按F2进入粘贴模式， 再次按离开
set pastetoggle=<F2>



"""""""""""""""""""""""""""""""""" 映射
let mapleader=","
inoremap <leader>w <Esc>:w<cr>

" 使用 ctrl+h/j/k/l 选择 window
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" 未生效
" syntax on

""""""""""""""""""""""""""""""""""" vim-plug插件管理
call plug#begin('~/.config/nvim/plugged')

" 主题deus
Plug 'theniceboy/vim-deus'
" 状态栏插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


call plug#end()



"""""""""""""""""""""""""""""""""" 主题
" 主题 安装插件后才有此主次
colorscheme deus
