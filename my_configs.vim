"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source other files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.vim

source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/filetypes.vim
source ~/.vim/vimrcs/plugins_config.vim
source ~/.vim/vimrcs/extended.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Stuff from dotfiles repo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make Vim more useful
set nocompatible
" Allow cursor keys in insert mode
set esckeys
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*
" Use the Solarized Dark theme
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Highlight current line
set cursorline
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Enable mouse in all modes
set mouse=a
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Tmux support mouse
set ttymouse=xterm2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disable Ex Mode
" Ex mode is pretty much useless for me and is confusing for
" newbies
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map q: :echom "Ex mode disabled"<cr>
nnoremap Q :echom "Ex mode disabled 12"<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MiniBufExplorer Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Todo: update lightline config to correctly name MiniBufExplorer

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AutoPairs Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Todo: map auto-pairs toggle to <leader>ap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto reload after config change
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
    autocmd BufWritePost *my_configs.vim nested source $MYVIMRC
augroup END " }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python Stuff
" As per https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight BadWhitespace ctermbg=red guibg=red

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set nu

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinition<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Web Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set nu


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clipboard stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_list_hide='.*\.swp$,.*\.pyc'
let g:netrw_hide = 1
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Handy Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" deletes buffer but keeps window splits in tact
map <C-c> :BD<cr>

" Meta- up / down goes a paragraph back / forward
" These are not really in the spirit of vim though
" nmap <Esc>[1;9A {
" imap <Esc>[1;9A <C-o>{
" nmap <Esc>[1;9B }
" imap <Esc>[1;9B <C-o>}

" Meta- h/k goes back forward WORD / word
" imap <Esc>h <S-Left>
" nmap <Esc>h <S-Left>
" imap <Esc>l <S-Right>
" nmap <Esc>l <S-Right>
