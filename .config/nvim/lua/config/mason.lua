require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",    -- bash-language-server
    "lua_ls",    -- lua-language-server (nouveau nom dans lspconfig)
  },
  automatic_installation = true, -- installe automatiquement si jamais absent
})
