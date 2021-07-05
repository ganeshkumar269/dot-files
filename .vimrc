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
" to have multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" https://www.youtube.com/watch?v=gfa2_6OeOkk
" smoother scrolling
Plug 'yuttie/comfortable-motion.vim'
" customize start menu
Plug 'mhinz/vim-startify'
" do git commands from vim
Plug 'tpope/vim-fugitive'
" source code browser
Plug 'yegappan/taglist'
" for debugging
Plug 'puremourning/vimspector'
" for maximising a window
Plug 'szw/vim-maximizer'
" git diff info can be seen on editor
Plug 'airblade/vim-gitgutter'
" for easier movement
Plug 'easymotion/vim-easymotion'

call plug#end()

syntax on
colorscheme onedark
let mapleader = ';'
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

" https://www.youtube.com/watch?v=gfa2_6OeOkk
" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap  <C-Up> :resize -3<CR>
noremap  <C-Down> :resize +3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K
" https://www.reddit.com/r/vim/comments/aa9quh/list_custom_key_binding/
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <leader>gtp :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
nnoremap <leader>gti :YcmCompleter GoToInclude<CR>
nnoremap <leader>gdf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gdc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>yd :YcmDiags<CR>
" https://stackoverflow.com/questions/5559029/quickly-switching-buffers-in-vim-normal-mode
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :bd<cr>

" toggle taglist https://vi.stackexchange.com/questions/5941/summary-of-functions-in-current-file
nnoremap <leader>l : TlistToggle<CR>

" map for maximiser
map <leader>m : MaximizerToggle<CR>

" vimspector mappings https://www.youtube.com/watch?v=AnTX2mtOl9Q
fun GotoWindow(id)
	call win_gotoid(a:id)
	MaximizerToggle
endfun

nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcp :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" https://www.youtube.com/watch?v=S6lK0437hQM
" inbuilt terminal
nnoremap <leader>tt :below vertical terminal<CR>

" easy-motion maps

