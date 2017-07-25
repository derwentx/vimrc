git submodule update --init --recursive

cd ~/.vim

echo 'set runtimepath+=~/.vim

source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/filetypes.vim
source ~/.vim/vimrcs/plugins_config.vim
source ~/.vim/vimrcs/extended.vim

try
source ~/.vim/my_configs.vim
catch
endtry' > ~/.vimrc

# Install YCM
cd ~/.vim/bundle/YouCompleteMe
brew install cmake go cargo mono rust
npm install -g typescript
./install.py --gocode-completer --clang-completer --tern-completer --racer-completer --omnisharp-completer


echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
