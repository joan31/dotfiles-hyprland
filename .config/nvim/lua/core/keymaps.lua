local map = require("utils").map

-- Basic keybindings for common actions
map("n", "<leader>w", ":w<CR>")               -- Save current buffer
map("n", "<leader>q", ":q<CR>")               -- Quit current window
map("n", "<leader>e", ":NvimTreeToggle<CR>")  -- Toggle file explorer (NvimTree)

-- Telescope keybindings for fuzzy finding
map("n", "<leader>ff", ":Telescope find_files<CR>")  -- Find files in workspace
map("n", "<leader>fg", ":Telescope live_grep<CR>")   -- Search text live in files
map("n", "<leader>fb", ":Telescope buffers<CR>")     -- List open buffers

-- Inspect keybinding (for debugging or inspecting Lua objects)
map("n", "<leader>i", ":Inspect<CR>")

map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
