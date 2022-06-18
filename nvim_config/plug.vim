call plug#begin()

" UI
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/nerdtree' |
            \ Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

" telescope and it's dependences
Plug 'https://github.com/BurntSushi/ripgrep'
Plug 'https://github.com/sharkdp/fd'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" code writing
Plug 'https://github.com/preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight/'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'https://github.com/sbdchd/neoformat'

" copilot
"Plug 'https://github.com/github/copilot.vim'

" debugger
"Plug 'https://github.com/puremourning/vimspector'
" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

