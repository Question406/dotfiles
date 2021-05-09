set number "line number
set nocompatible "nocompatible mode
set relativenumber "set relative linenumber
set ts=4 "inline = 4
set shiftwidth=4 "On pressing tab, insert 4 spaces
set expandtab "tab as 4 spaces
set cursorline "highlight current line number
set encoding=UTF-8 "use utf-8 as default encoding
set hlsearch "highlight search
set noshowmode "don't show --insert-- since vim-airline is used
set noerrorbells "disable beeping when error occurs
set backspace=indent,eol,start "backspace function restore after using coc.vimlsp, FIXME: don't know why
set wildmenu "vim command auto-completion
set wildmode=longest:list,full "vim command list configuration
set showcmd
language en_US.utf8 " default language setting in english

"different cursor under different mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q""]"

" let sapce be leader
let mapleader = "\<space>"

" clean space at the end of line
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" plugins in use
source $HOME/.vim/custom/plugins.vim


" vertical line indent
" for plug indent line
let g:indentLine_char='¦'
let g:indentLine_enabled = 1
let g:indentLine_defaultGroup = 'SpecialKey'

" default language setting in english
language en_US.utf8

" for plub vim-airline
" let airline mode show only first character
" n for normal
" i for insert
" v for visual
" V for visual-line
" ^V for visual-block
" FIXME: there're other modes, but i don't understand what they are now
let g:airline_mode_map = {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'v' : 'V',
    \ 'V' : 'V-L',
    \ '' : 'V-B',
    \ }
let g:airline#extenxtions#tabline#enabled=1

" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=3000

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" coc-vim settings
if executable('npm')
    " coc.nvim settings
    let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-jedi', 'coc-sh', 'coc-rust-analyzer', 'coc-clangd']
    " From official repository

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-o> to trigger completion.
    " Note: if has neovim
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documennation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code. TODO: what to do?
    "xmap <leader>f  <Plug>(coc-format-selected)
    "nmap <leader>f  <Plug>(coc-format-selected)
endif
" End of COC-settings

" Leaderf settings, default now
let g:Lf_ShortcutF = "<leader>ff"

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
" End of Leaderf settings

" run python file in terminal with one command
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

" NERDTree toggler, ctrl+n
map <C-n> : NERDTreeToggle<CR>

filetype plugin on

" onedark theme
syntax on
colorscheme onedark

" MUST set after colorscheme to overide colorscheme settings
" line number background to make it clear
hi LineNr guibg=NONE ctermbg=245

" let vim be transparent as terminal
hi Normal guibg=NONE ctermbg=NONE

" map jk as Esc in both insert & visual mode
inoremap jk <Esc>
xnoremap jk <Esc>

