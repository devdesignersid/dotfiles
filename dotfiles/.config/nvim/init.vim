source $HOME/.config/nvim/plug-config/signify.vim
set shell=/usr/local/bin/zsh


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
Plug 'mhinz/vim-startify'
Plug 'dense-analysis/ale'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'vim-syntastic/syntastic'
Plug 'rhysd/vim-clang-format'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sainnhe/gruvbox-material'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'grvcoelho/vim-javascript-snippets'
Plug 'christoomey/vim-system-copy'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'elixir-editors/vim-elixir'
Plug 'liuchengxu/space-vim-dark'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'vimwiki/vimwiki'

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
" colorscheme gruvbox
" Available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'medium'
"colorscheme gruvbox-material
"
colorscheme space-vim-dark
hi Comment cterm=italic



let g:airline_powerline_fonts = 1
let g:shades_of_purple_airline = 2
let g:airline_theme = 'shades_of_purple'
let g:airline#extensions#tabline#enabled = 1


let g:snipMate = { 'snippet_version' : 1 }

set splitright
set splitbelow

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction

" using silver-searcher to avoid .gitignore files/folders
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" coc intellisense for web languages
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



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


" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
" Equivalent to the above.
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_linters = {'rust': ['analyzer']}
let g:ale_fixers = {'elixir': ['mix_format']}

let g:vimspector_enable_mappings = 'HUMAN'

let g:indentLine_fileTypeExclude = ['markdown']

" vimwiki setup
let g:vimwiki_list = [{'path': '/Users/siddharth/Documents/Workspace/wiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md' : 'markdown', '.markdown' : 'markdown', '.mdown' : 'markdown'}
" Makes vimwiki markdown links as [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1

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

" Javascript snippet autocompletion.
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger


let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

nnoremap <Leader>f :<C-u>ClangFormat<CR>





