" This is the plugins, use vim-plug as manager

call plug#begin('~/.vim/plugged')
" auto complete {}
Plug 'jiangmiao/auto-pairs'

" side view directory
Plug 'preservim/nerdtree', {'on' : 'NERDTreeToggle'} " on-demand loading
Plug 'ryanoasis/vim-devicons' " file type icons

" vim git plug
Plug 'tpope/vim-fugitive'

" bottom stattranspus bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" underline word under cursor
Plug 'itchyny/vim-cursorword'

" indent line
Plug 'Yggdroot/indentLine'

" better commeent
Plug 'preservim/nerdcommenter'

" fuzzy finder for a lot of things
if has("python3")
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
endif

" auto-completion, LSP client
if executable('npm')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" color schemes
" onedark color scheme
Plug 'joshdick/onedark.vim'

" tender color scheme
" Plug 'jacoborus/tender.vim'

call plug#end()


