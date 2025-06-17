local null_ls = require("null-ls")
null_ls.setup {
  sources = {
    -- CSS/Markdown formatter
    null_ls.builtins.formatting.prettier,
    -- Python formatter
    null_ls.builtins.formatting.black,
    -- Bash formatter
    null_ls.builtins.formatting.shfmt,
    -- Lua formatter
    null_ls.builtins.formatting.stylua,
    -- C/C++ formatter
    null_ls.builtins.formatting.clang_format,
  }
}
