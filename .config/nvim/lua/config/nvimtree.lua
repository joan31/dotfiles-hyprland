require("nvim-tree").setup {
  view = {
    width = 30,
    side = "left",
    relativenumber = false,
  },
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
    },
  },
}
