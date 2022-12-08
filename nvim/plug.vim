call plug#begin()

" UI
Plug 'https://github.com/preservim/nerdtree' |
            \ Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'nvim-lua/plenary.nvim'

" code writing
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'https://github.com/p00f/clangd_extensions.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'numToStr/Comment.nvim'

call plug#end()

