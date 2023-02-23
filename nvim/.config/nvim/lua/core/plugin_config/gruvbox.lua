vim.o.termguicolors = true
require("gruvbox").setup({
    underline = true,
    transparent_mode = false,
})

vim.o.background = "dark"
vim.cmd [[ colorscheme gruvbox ]]
