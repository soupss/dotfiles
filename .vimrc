call plug#begin('~/.vim/plugged')
    Plug 'lervag/vimtex'
        let g:vimtex_quickfix_ignore_filters = [
                    \ 'Underfull',
                    \ 'pgfplots',
                    \ 'Overfull',
                    \]
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
        let g:tex_flavor = 'latex'
    Plug 'rrethy/vim-illuminate'
        let g:Illuminate_delay = 0
        let g:Illuminate_highlightUnderCursor = 0
    Plug 'airblade/vim-gitgutter'
        let g:gitgutter_sign_removed = '-'
    "syntax
    Plug 'tpope/vim-markdown'
    Plug 'morhetz/gruvbox'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'uiiaoo/java-syntax.vim'
        let g:gutentags_define_advanced_commands = 1
    Plug 'majutsushi/tagbar'
        let g:tagbar_compact = 1
        let g:tagbar_show_data_type = 1
        let g:tagbar_iconchars = ['>', 'v']
        let g:tagbar_zoomwidth = 0
        let g:tagbar_wrap = 1
        let g:tagbar_width = 55
        let g:tagbar_sort = 0
call plug#end()

" General settings
set nocompatible
set encoding=utf8
filetype plugin indent on
syntax on
set backspace=indent,eol,start
set hidden
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent
set showmode showcmd
set number relativenumber
set cursorline
set showmatch
set matchpairs+=<:>
set splitbelow splitright
set ignorecase smartcase incsearch
set wrap
set scrolloff=2
set signcolumn=yes
set wildmenu wildmode=longest,full
set path+=**
set lazyredraw
set noeb vb t_vb= 
set notimeout ttimeout
set list lcs=tab:\ \ ,extends:…,precedes:…,nbsp:~,trail:~
set fillchars+=vert:│,fold:\ ,diff:x
set showbreak=…
set cpoptions+=n
" show search result index+count
set shortmess-=S
set nobackup nowritebackup noswapfile undofile
set foldmethod=manual
set foldlevel=1
set foldnestmax=1 "dont fold nested
set foldminlines=0
set undodir=/tmp//
let g:vimtex_view_method='skim'
" switch to manual foldmethod in insert mode, fixes unwanted behaviour where folds open in insert mode
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
" Disable automatic comment when moving to a new line
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" correct hpp filetype
au BufEnter *.hpp setlocal filetype=hpp syntax=cpp
" when sourcing vimrc in hpp file
if (&ft == 'hpp')
    setlocal filetype=hpp syntax=cpp
endif
au BufEnter *.cpp let b:fswitchdst = 'hpp' | let b:fswitchlocs = '../inc'
au BufEnter *.hpp let b:fswitchdst = 'cpp' | let b:fswitchlocs = '../src'
set noesckeys

" colors
set t_Co=256
set background=dark
colorscheme gruvbox

" put highlights here
function Highlights()
    hi link javaIdentifier NONE
    hi! link SignColumn LineNr
    hi link GitGutterAdd GruvBoxAqua
    hi link GitGutterChange GruvBoxYellow
    hi link GitGutterDelete GruvBoxRed
    hi link GitGutterChangeDelete GruvBoxOrange
    hi StatusLine cterm=none ctermbg=none ctermfg=2
    hi StatisLineGreen cterm=none ctermbg=none ctermfg=7
    hi StatusLineNC cterm=none ctermbg=none ctermfg=242
    hi illuminatedWord cterm=reverse
    "red
    hi User1 ctermfg=167
    "green
    hi User2 ctermfg=142
    hi Folded ctermbg=236
    hi MatchParen ctermbg=none cterm=bold,underline ctermfg=green
endfunction
call Highlights()

" Statusline
set laststatus=2
function! Statusline() abort
    let l:line=''
    let l:line.=' %1*%M%*%t%<' " modified tag and filename
    let l:line.='%='
    let l:line.='%0.P        ' " percentage through file
    let l:line.='%l:%c/%L ' " col:current line/total lines
    return l:line
endfunction
set statusline=%!Statusline()

" only show cursorline on current split
augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" keybinds
let mapleader = ' '
nnoremap <F2> :so $MYVIMRC<cr>
nnoremap Y y$
" center cursor
nnoremap n nzz
nnoremap N Nzz
" move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
" split zoom
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=
" repeat last macro instead of ex mode
nnoremap Q @@
" repeat last command mode
nnoremap <c-q> @:
" delete without saving to register
" verb: suck (to void)
nnoremap s "_d
nnoremap S "_d$
nnoremap ss "_dd
command WQ wq
command Wq wq
command W w
command Q q
nmap gs ysiw
" go to unsaved buffer
nnoremap <leader><cr> :bm<cr>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
nnoremap <C-b> <C-a>

" resize splits with arrow keys
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-
nnoremap <Left> <C-w><
nnoremap <Right> <C-w>>
nnoremap <leader>s :set hlsearch! hlsearch?<cr>
nnoremap <leader>l :set wrap! wrap?<cr>
nnoremap <bs> :b#<cr>
nnoremap <silent> <leader>o :Files<cr>
nnoremap <silent> <leader>b :Buffers<cr>
" cleaner exit from insert/visual mode
vnoremap <ESC> <C-c>
inoremap <ESC> <C-c>
" add numbered j/k to jumplist
nnoremap <silent> k :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'k'<CR>
nnoremap <silent> j :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'j'<CR>
" lower case = under cursor
" upper case = search
" find function definition
nnoremap <leader>d :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader><leader>d :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>D :cs find g
nnoremap <leader><leader>D :vert scs find g
" find variable definition: where a symbol gets assigned a value
nnoremap <leader>a :cs find a <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader><leader>a :vert scs find a <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>A :cs find a
nnoremap <leader><leader>A :vert scs find a
" find calls: where function is being used
nnoremap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader><leader>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>C :cs find c
nnoremap <leader><leader>C :vert scs find c
" find exact (egrep)
nnoremap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader><leader>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>E :cs find e
nnoremap <leader><leader>E :vert scs find e
" open file
nnoremap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader><leader>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
" find files that include the filename
nnoremap <leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap <leader><leader>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" find files that include current file
nnoremap <leader>I :cs find i %:t<cr>
nnoremap <leader><leader>I :vert scs find i %:t<cr>
" COMPILING/RUNNING
" PYTHON
" run current file
au filetype python nnoremap <F5> :w<cr>:!clear<cr>:exec '!python3 %'<cr>
" run parent module (__main__ file in this dir)
au filetype python nnoremap <F6> :w<cr>:!clear<cr>:exec '!python3 .'<cr>
" C/C++
" compile and run current c file
au filetype c nnoremap <F5> :w<cr>:!clear<cr>:exec '!gcc % -o %:r && ./%:r'<cr>
" compile and run current c++ file
au filetype cpp nnoremap <F5> :w<cr>:!clear<cr>:exec '!g++ % -o %:r && ./%:r'<cr>
" compile with makefile
au filetype cpp nnoremap <leader><F6> :wa<cr>:!clear && make<cr>
" run ./main
au filetype cpp nnoremap <F6> :!clear && ./bin/main<cr>
au filetype java nnoremap <F5> :w<cr>:!clear<cr>:exec '!javac %'<cr>:exec '!time java -cp %:p:h %:t:r'<cr>
nnoremap gd <C-]>
nnoremap <silent> <leader>t :TagbarOpen fj<CR>
nnoremap <silent> <leader>c :TagbarClose<CR>
