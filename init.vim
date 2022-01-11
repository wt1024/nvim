

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

" 按F2进入粘贴模式,  再次按离开 与 nerdtree 冲突
" set pastetoggle=<F2>

" 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 如果不需要可以关掉
"    好处：误删什么的，如果以前屏幕打开，可以找回....惨痛的经历
set t_ti= t_te=

" 突出显示当前列
set cursorcolumn
" 突出显示当前行
set cursorline

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7


"""""""""""""""""""""""""""""""""" 映射
let mapleader=","
" Quickly save the current file
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>

" Quickly close the current window
inoremap <leader>q <Esc>:q<CR>
noremap <leader>q :q<CR>

inoremap <leader>wq <Esc>:wq<CR>
noremap <leader>wq :wq<CR>


" 使用 ctrl+h/j/k/l 选择 window
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" 未生效
" syntax on

" tab/buffer相关

" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" 使用方向键切换buffer
noremap <left> :bp<CR>
noremap <right> :bn<CR>


" tab 操作
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim

" tab切换
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

" 去掉了最后的 <cr>, 方便再输入文件名
map <leader>te :tabedit 
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
"
" nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>


""""""""""""""""""""""""""""""""""" vim-plug插件管理
call plug#begin('~/.config/nvim/plugged')

" 主题deus
Plug 'theniceboy/vim-deus'
" molokai
" 主题 molokai
Plug 'tomasr/molokai'

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

" 模糊搜搜
" fzf.viim 的 Files代替
" Plug 'ctrlpvim/ctrlp.vim'

" 文件内移动
Plug 'easymotion/vim-easymotion'

" 缩进线 未生效
" Plug 'yggdroot/indentline'

" 模糊搜索
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

" 搜索和替换
Plug 'brooth/far.vim'

" 高亮
Plug 'lfv89/vim-interestingwords'

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
"     ,v 光标到目录树中当前文件,  <c-w>p 返回
nnoremap <leader>v :NERDTreeFind<CR>
nnoremap <leader>g :NERDTreeToggle<CR>
" 显示当前文件所在目录目录  Reveal in NERDTree
noremap <leader>r :exec("NERDTree ".expand('%:h'))<CR>
" 打开vim 自动打开 NERDTree
" autocmd VimEnter * NERDTree
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

" ctrl-p 搜索
let g:ctrlp_map = '<c-p>'

" easymotion 递归映射 后面的命令也是映射，所以用递归映射
nmap ss <Plug>(easymotion-s2)


" ################### 显示增强 ###################

" airline {{{
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_left_sep = '▶'
    let g:airline_left_alt_sep = '❯'
    let g:airline_right_sep = '◀'
    let g:airline_right_alt_sep = '❮'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    " 是否打开tabline
    " let g:airline#extensions#tabline#enabled = 1
" }}}


nnoremap <c-p> <Esc>:Files

















