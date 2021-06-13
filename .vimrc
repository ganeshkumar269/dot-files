call plug#begin('~/.vim/plugged')
Plug 'preservim/NERDTree'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" https://www.youtube.com/watch?v=n9k9scbTuvQ
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ycm-core/YouCompleteMe'
" to comment out lines
Plug 'tpope/vim-commentary'
call plug#end()

syntax on
colorscheme onedark
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" copy (write) highlighted text to .vimbuffer
vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
" paste from buffer
map <C-v> :r ~/.vimbuffer<CR>	

set number relativenumber
" :AirlineTheme dark-theme

" https://www.youtube.com/watch?v=DogKdiRx7ls
set noerrorbells
set smartindent
set incsearch
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
nnoremap <Space>n :NERDTreeToggle<CR>
nnoremap <F2> :Files<CR>
