" Use the Solarized Dark theme
set background=dark
colorscheme solarized
set gfn=SauceCodePro\ Nerd\ Font:h14
set guifont=SauceCodePro\ Nerd\ Font:h14
" Don’t blink cursor in normal mode
" set guicursor=n:blinkon0
" Better line-height
" set linespace=8



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ASKPASS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_macvim')
	let $SUDO_ASKPASS="/Applications/MacVim.app/Contents/MacOS/macvim-askpass"
	let $DISPLAY=":0"
endif