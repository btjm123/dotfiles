" enables us to switch from block to thin cursor in INSERT mode
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[2 q"

" this speeds up the switching
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast
set number

" change tab size to 2 and enable auto-indent
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent


" enables mouse - useful when one is panicking, and selection of actual text
set mouse=a

" enables auto closure braces
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha
