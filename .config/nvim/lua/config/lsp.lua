local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Custom root_dir function for lua_ls
local function custom_root_dir(fname)
  local root = lspconfig.util.root_pattern(".git", "init.lua")(fname)
  if root then
    return root
  end

  local nvim_config = vim.fn.expand("~/.config/nvim")
  if vim.startswith(fname, nvim_config) then
    return nvim_config
  end

  -- Fallback: if no project root found, default to ~/Projects
  local default_root = vim.fn.expand("~/Projects")
  if vim.fn.isdirectory(default_root) == 1 then
    return default_root
  end

  -- Final fallback: nil to avoid attaching
  return nil
end

-- LSP setup
local servers = { "pyright", "bashls", "clangd" }

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    capabilities = capabilities,
  }
end

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      workspace = {
        library = {
          vim.fn.expand("~/.config/nvim/lua"),
          vim.fn.expand("~/.local/share/nvim/site/pack/packer/start"),
        },
        checkThirdParty = false,
      },
    },
  },
  root_dir = custom_root_dir,
}
