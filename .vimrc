set number "line number
"set relativenumber "set relative linenumber
set ts=4 "inline = 4
set shiftwidth=4 "On pressing tab, insert 4 spaces
set expandtab "tab as 4 spaces
set cursorline "highlight current line number
"set encoding=UTF-8 "use utf-8 as default encoding
"different cursor under different mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q""]"

" vertical line indent
" for plug indent line
let g:indentLine_char='¦'
let g:indentLine_enabled = 1
let g:indentLine_defaultGroup = 'SpecialKey'

" let airline mode show only first character
" n for normal
" i for insert
" v for visual
" V for visual-line
" ^V for visual-block
" there're other modes, but i don't understand what they are now
let g:airline_mode_map = {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'v' : 'V',
    \ 'V' : 'V-L',
    \ '' : 'V-B',
    \ }

" NERDTree toggler, ctrl+n
map <C-n> : NERDTreeToggle<CR>

call plug#begin('~/.vim/plugged')
" auto complete {}
Plug 'jiangmiao/auto-pairs'

" side view directory
Plug 'preservim/nerdtree'
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

" color schemes
" onedark color scheme
Plug 'joshdick/onedark.vim'

" tender color scheme
" Plug 'jacoborus/tender.vim'

call plug#end()

filetype plugin on

" onedark theme
syntax on
colorscheme onedark

" MUST set after colorscheme to overide colorscheme settings
" line number background to make it clear
hi LineNr guibg=NONE ctermbg=245

" let vim be transparent as terminal
hi Normal guibg=NONE ctermbg=NONE
