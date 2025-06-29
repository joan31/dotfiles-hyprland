require("nvim-treesitter.configs").setup {
  ensure_installed = { "lua", "python", "bash", "c", "cpp" },
  highlight = { enable = true },
  indent = { enable = true }
}
