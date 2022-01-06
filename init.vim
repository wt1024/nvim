

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

" 按F2进入粘贴模式,  再次按离开
set pastetoggle=<F2>



"""""""""""""""""""""""""""""""""" 映射
let mapleader=","
inoremap <leader>w <Esc>:w<cr>

" 使用 ctrl+h/j/k/l 选择 window
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

noremap bn :bn<cr>
noremap bp :bp<cr>

" 未生效
" syntax on

""""""""""""""""""""""""""""""""""" vim-plug插件管理
call plug#begin('~/.config/nvim/plugged')

" 主题deus
Plug 'theniceboy/vim-deus'
" 状态栏插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 目录树插件
Plug 'preservim/nerdtree'

" 开屏提示
Plug 'mhinz/vim-startify'

" 
Plug 'tpope/vim-surround'
" 移动插件
Plug 'matze/vim-move'

" 缩进线
Plug 'yggdroot/indentline'

call plug#end()



"""""""""""""""""""""""""""""""""" 主题
" 主题 安装插件后才有此主次
colorscheme deus


"""""""""""""""""""""""""""""""""" 复杂配置
" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" NERDTree config
noremap <F2> :NERDTreeToggle<CR>
" 显示当前文件所在目录目录  Reveal in NERDTree
noremap <s-r> :exec("NERDTree ".expand('%:h'))<CR>
" 打开vim 自动打开 NERDTree
autocmd VimEnter * NERDTree
" 默认光标在右侧
autocmd VimEnter * wincmd w
" 如果打开的窗口只有NERDTree窗口时，直接退出vim
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" airline
set laststatus=2  "永远显示状态栏
" 支持 powerline 字体
" let g:airline_powerline_fonts = 1  
" 显示窗口tab和buffer
let g:airline#extensions#tabline#enabled = 1 

