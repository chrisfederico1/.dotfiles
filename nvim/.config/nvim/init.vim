syntax on


set spell
set laststatus=2
set noerrorbells
set nu rnu
set nowrap
set incsearch
set smartindent
set tabstop=4 softtabstop=4
set undodir=~/.config/nvim/undodir
set undofile
set smartcase


set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgreycall 



call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'vim-utils/vim-man'                           
Plug 'tpope/vim-fugitive'                         
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'                           
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'mrk21/yaml-vim'

call plug#end()



colorscheme gruvbox
set background=dark
