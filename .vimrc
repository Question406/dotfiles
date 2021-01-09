set number "line number
set ts=4 "inline = 4
set shiftwidth=4 "On pressing tab, insert 4 spaces
set expandtab "tab as 4 spaces

" different cursor under different mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q""]"

" vertical line indent
let g:indentLine_char='¦'
let g:indentLine_enabled = 1
let g:indentLine_defaultGroup = 'SpecialKey'

" NERDTree toggler
map <C-n> : NERDTreeToggle<CR>

call plug#begin('~/.vim/plugged')
" auto complete {}
Plug 'jiangmiao/auto-pairs'

" side view directory
Plug 'preservim/nerdtree'

" bottom status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" underline word under cursor
Plug 'itchyny/vim-cursorword'

" indent line 
Plug 'Yggdroot/indentLine'

call plug#end()

