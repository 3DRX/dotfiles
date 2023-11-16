call plug#begin()
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'toppair/peek.nvim', { 'do': 'deno task --quiet build:fast'}
Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }
Plug 'rebelot/kanagawa.nvim'
Plug 'davidgranstrom/nvim-markdown-preview'
Plug 'zbirenbaum/copilot.lua'
Plug 'zbirenbaum/copilot-cmp'
Plug 'nvim-lua/plenary.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'folke/neodev.nvim'
Plug 'nvimdev/lspsaga.nvim', { 'branch': 'main' }
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'williamboman/mason.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'debugloop/telescope-undo.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'windwp/nvim-ts-autotag'
Plug 'rafamadriz/friendly-snippets'
Plug 'lervag/vimtex'
Plug 'kevinhwang91/nvim-bqf'
call plug#end()
