return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim"
    },
    event = "VeryLazy",
    config = function()
      require("config.formatter")
    end
  }
}
