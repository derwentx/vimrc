set runtimepath+=~/.vim

source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/filetypes.vim
source ~/.vim/vimrcs/plugins_config.vim
source ~/.vim/vimrcs/extended.vim

try
    source ~/.vim/my_configs.vim
catch
    echo v:exception
    echom "could not source my_configs.vim because of an error"
endtry
