git submodule update --init --recursive

ln -s ./vimrc.vim ~/.vimrc
ln -s . ~/.vim

# Install YCM
cd ~/.vim/bundle/YouCompleteMe
brew install cmake go mono rust
npm install -g typescript
./install.py --gocode-completer --clang-completer --tern-completer --racer-completer --omnisharp-completer


echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
