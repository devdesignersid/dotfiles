source $HOME/.config/nvim/plug-config/signify.vim


call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

call plug#end()

set t_Co=256
syntax on
set number
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
set title

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark 
colorscheme gruvbox
let g:airline_powerline_fonts = 1

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


" vim-closetag settings.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
   \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>' 



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
nmap <C-T> :TagbarToggle<CR>

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 5k
noremap <silent> E 5j

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>

" Faster in-line navigation
noremap W 5w
noremap B 5b

" set h (same as n, cursor left) to 'end of word'
noremap h e

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
