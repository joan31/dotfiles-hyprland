return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" },
  config = function()
    require("config.cmp")
  end
}
