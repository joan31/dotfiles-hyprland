return {
  {
    "williamboman/mason.nvim",
    lazy = false, -- load Mason at startup so LSP servers get installed on time
    config = function()
      require("config.mason") -- your file with mason and mason-lspconfig setup
    end,
  }
}
