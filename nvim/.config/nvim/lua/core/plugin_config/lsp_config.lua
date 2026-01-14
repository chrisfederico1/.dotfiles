-- lsp_config.lua (fully deprecated-free for Neovim 0.11+ & mason-lspconfig v2.1.0)
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "html", "cssls", "ansiblels", "bashls", "rust_analyzer", "clangd", "yamlls", "terraformls", "jsonls", "marksman", "pylsp", "ts_ls", "jdtls", "gradle_ls" },
  automatic_enable = true,  -- Auto-enables Mason-installed servers
})

-- Shared on_attach and capabilities
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, silent = true }
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Helper: Configure any server with shared opts + custom overrides
local function setup_server(server_name, custom_opts)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  if custom_opts then
    for k, v in pairs(custom_opts) do
      opts[k] = v
    end
  end
  vim.lsp.config(server_name, opts)
  vim.lsp.enable(server_name)
end

-- Apply to all Mason-managed servers
local mason_servers = { "html", "cssls", "ansiblels", "bashls", "rust_analyzer", "clangd", "yamlls", "terraformls", "jsonls", "marksman", "pylsp", "ts_ls", "jdtls", "gradle_ls" }
for _, server in ipairs(mason_servers) do
  setup_server(server)
end

-- lua_ls: Use Arch system binary + Neovim settings
setup_server("lua_ls", {
  cmd = { "lua-language-server" },
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  },
})
