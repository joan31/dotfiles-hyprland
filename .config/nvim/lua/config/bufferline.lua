require("bufferline").setup({
  options = {
    mode = "buffers", -- or "tabs"
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = "slant",
    offsets = {
      {
        filetype = "NvimTree",
        text = "🗂️ File Explorer",
        text_align = "left",
        separator = true,
      },
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "slant", -- or "thin", "padded_slant", etc
    },
  },
})
