local opt = vim.opt

-- Indentation settings
opt.expandtab = true       -- Use spaces instead of tabs
opt.tabstop = 2            -- Number of spaces per tab
opt.shiftwidth = 2         -- Number of spaces for each indentation level
opt.smartindent = true     -- Enable smart indentation
opt.autoindent = true      -- Copy indent from current line when starting a new line

-- Line numbering and cursor
opt.number = true          -- Show absolute line numbers
opt.relativenumber = false -- Show relative line numbers
opt.cursorline = true      -- Highlight current line
opt.signcolumn = "yes"     -- Always show sign column (for diagnostics, git, etc.)

-- Search settings
opt.ignorecase = true      -- Case insensitive search
opt.smartcase = true       -- Override ignorecase if search contains uppercase letters
opt.hlsearch = true        -- Highlight search results
opt.incsearch = true       -- Show search matches as you type

-- File and undo management
opt.swapfile = false       -- Disable swap files
opt.undofile = true        -- Enable persistent undo
opt.backup = false         -- Disable backup files
opt.writebackup = false    -- Disable backup before overwriting a file

-- Scrolling behavior
opt.scrolloff = 8         -- Keep 8 lines visible above/below cursor
opt.sidescrolloff = 8     -- Keep 8 columns visible left/right of cursor

-- Performance and timing
opt.lazyredraw = true     -- Don't redraw while executing macros/scripts for speed
opt.timeoutlen = 300      -- Time in ms to wait for a mapped sequence to complete
