"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Derwent Vim Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" => Font
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set gfn=Knack\ Nerd\ Font:h14

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
" => Handy Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" deletes buffer but keeps window splits in tact
map <C-c> :BD<cr>
