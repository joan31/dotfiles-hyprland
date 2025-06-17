local set = vim.api.nvim_set_hl

local palette = {
  bg        = "#1e1e2e",
  bg_alt    = "#24283b",
  fg        = "#c0caf5",
  fg_alt    = "#a9b1d6",
  black     = "#1a1b26",
  gray      = "#414868",
  blue      = "#7dcfff",
  violet    = "#bb9af7",
  green     = "#9ece6a",
  yellow    = "#e0af68",
  orange    = "#ff9e64",
  red       = "#f7768e",
  pink      = "#ff6c6b",
  border    = "#7aa2f7",
}

vim.cmd("highlight clear")
vim.o.background = "dark"
vim.o.termguicolors = true

-- Base
set(0, "Normal",           { fg = palette.fg, bg = palette.bg })
set(0, "NormalNC",         { fg = palette.fg, bg = palette.bg_alt })
set(0, "LineNr",           { fg = palette.gray, bg = palette.bg })
set(0, "CursorLineNr",     { fg = palette.blue, bold = true })
set(0, "CursorLine",       { bg = "#2a2d3a" })
set(0, "Visual",           { bg = "#3a3d4f" })
set(0, "ColorColumn",      { bg = "#2a2d3a" })
set(0, "VertSplit",        { fg = palette.gray })

-- Statusline
set(0, "StatusLine",       { fg = palette.fg, bg = palette.bg_alt })
set(0, "StatusLineNC",     { fg = palette.fg_alt, bg = palette.bg })

-- Pmenu
set(0, "Pmenu",            { fg = palette.fg, bg = "#2c3040" })
set(0, "PmenuSel",         { fg = palette.black, bg = palette.violet })
set(0, "PmenuThumb",       { bg = palette.violet })

-- Diagnostics
set(0, "DiagnosticError",  { fg = palette.red })
set(0, "DiagnosticWarn",   { fg = palette.yellow })
set(0, "DiagnosticInfo",   { fg = palette.blue })
set(0, "DiagnosticHint",   { fg = palette.teal })

-- Git
set(0, "DiffAdd",          { bg = "#27352f" })
set(0, "DiffChange",       { bg = "#36384a" })
set(0, "DiffDelete",       { bg = "#3f2d3d" })
set(0, "DiffText",         { bg = "#3a4a67" })

-- Syntax
set(0, "Comment",          { fg = "#565f89", italic = true })
set(0, "Constant",         { fg = palette.violet })
set(0, "String",           { fg = palette.green })
set(0, "Identifier",       { fg = palette.blue })
set(0, "Function",         { fg = palette.teal })
set(0, "Statement",        { fg = palette.pink })
set(0, "Keyword",          { fg = palette.red, italic = true })
set(0, "PreProc",          { fg = palette.orange })
set(0, "Type",             { fg = palette.yellow })
set(0, "Special",          { fg = palette.violet })

-- Telescope
set(0, "TelescopeNormal",      { bg = palette.bg_alt, fg = palette.fg })
set(0, "TelescopeBorder",      { fg = palette.border, bg = palette.bg_alt })
set(0, "TelescopeSelection",   { bg = "#2f3340", fg = palette.fg })
set(0, "TelescopeMatching",    { fg = palette.green })

-- LSP
set(0, "LspReferenceText",     { bg = "#2a2d3a" })
set(0, "LspReferenceRead",     { bg = "#2a2d3a" })
set(0, "LspReferenceWrite",    { bg = "#2a2d3a" })

-- Treesitter
set(0, "@variable",        { fg = palette.fg })
set(0, "@function",        { fg = palette.teal })
set(0, "@keyword",         { fg = palette.red, italic = true })
set(0, "@type",            { fg = palette.yellow })
set(0, "@comment",         { fg = "#5a637d", italic = true })
