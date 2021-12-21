

" wangting
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""    
"如果vim插件管理器没有安装则自动安装    
if empty(glob('~/.config/nvim/autoload/plug.vim'))    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs    
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim    
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC    
endif



" 行号
set nu

" vim-plug插件管理
call plug#begin('~/.config/nvim/plugged')

" 主题deus
Plug 'theniceboy/vim-deus'


call plug#end()



" 主题
colorscheme deus
