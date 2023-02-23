local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- leader key mappings
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


return require('lazy').setup({
   'ellisonleao/gruvbox.nvim',
   'nvim-tree/nvim-tree.lua',
   'nvim-tree/nvim-web-devicons',
   'nvim-lualine/lualine.nvim',
   'nvim-treesitter/nvim-treesitter',
   'vim-test/vim-test',
   'hrsh7th/nvim-cmp',
   'mbbill/undotree',
   'hrsh7th/cmp-nvim-lsp',
   'L3MON4D3/LuaSnip',
   'christoomey/vim-tmux-navigator',
   'saadparwaiz1/cmp_luasnip',
   "rafamadriz/friendly-snippets",
   "lukas-reineke/indent-blankline.nvim",
   {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
   },
   {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { {'nvim-lua/plenary.nvim'}}
   },
   {
  "aurum77/live-server.nvim",
    build = function()
      require"live_server.util".install()
    end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  },
  {
  "danymat/neogen", 
    dependencies = "nvim-treesitter/nvim-treesitter", 
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    version = "*" 
  },
})
