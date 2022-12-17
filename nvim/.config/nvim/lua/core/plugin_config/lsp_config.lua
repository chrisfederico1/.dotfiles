require("mason").setup()
require("mason-lspconfig").setup({
ensure_installed = { "sumneko_lua", "html", "cssls", "ansiblels", "bashls", "clangd", "yamlls", "terraformls", "jsonls", "marksman", "pylsp", "tsserver"}
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

require("lspconfig").sumneko_lua.setup {}
require("lspconfig").html.setup {}
require("lspconfig").cssls.setup {}
require("lspconfig").ansiblels.setup {}
require("lspconfig").bashls.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").yamlls.setup {}
require("lspconfig").terraformls.setup {}
require("lspconfig").jsonls.setup {}
require("lspconfig").marksman.setup {}
require("lspconfig").pylsp.setup {}
require("lspconfig").tsserver.setup {}



