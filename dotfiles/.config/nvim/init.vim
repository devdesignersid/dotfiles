call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'frazrepo/vim-rainbow'

call plug#end()

set t_Co=256
syntax on
set number

set background=dark 
colorscheme gruvbox
let g:airline_powerline_fonts = 1

let g:rainbow_activate = 1

set splitright
set splitbelow

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction

" using silver-searcher to avoid .gitignore files/folders
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" coc intellisense for web languages
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" open terminal with ctrl-n
nnoremap <c-n> :call OpenTerminal()<CR>
" toggle NERDTree ctrl-b
map <C-b> :NERDTreeToggle<CR>
" switching between panes ctrl+j,k,l,h
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" searching gile with ctrl-p
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
