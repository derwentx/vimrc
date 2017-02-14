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

set gfn=Source\ Code\ Pro\ for\ Powerline:h12
