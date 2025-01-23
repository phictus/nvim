local function map(m, k, v)
    vim.keymap.set(m, k, v, {silent = true})
end

-- LuaSnip Arguments
map("n", "<Tab>", "<CMD>lua require(\"luasnip\").jump(1)<CR>")

-- Telescope keybindings
map("n", "<C-A-f>", "<CMD>Telescope find_files find_command=rg,--hidden,--files<CR>")
map("n", "<C-A-w>", "<CMD>Telescope live_grep<CR>")
map("n", "<C-A-d>", "<CMD>Telescope diagnostics<CR>")
map("n", "<C-A-e>", "<CMD>Telescope file_browser<CR>")
map("n", "<C-A-s>", "<CMD>Telescope file_browser path=~/.config/nvim/<CR>")

-- Fix * (Keep the cursor position, don"t move to next match)
map("n", "*", "*N")

-- Fix n and N. Keeping cursor in center
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Change buffer
map("n", "<A-b>", "<CMD>bn<CR>")

-- Delete buffer
map("n", "<C-b>", "<CMD>bd<CR>")
map("n", "<C-A-b>", "<CMD>bd!<CR>")

map("n", "<C-\\>", "<CMD>vertical resize +2<CR>")
map("n", "<A-\\>", "<CMD>horizontal resize +2<CR>")

-- Exit TERMINAL mode
map("t", "<Esc>", "<C-\\><C-n>")

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map("n", "<C-j>", "<CMD>move .+1<CR>")
map("n", "<C-k>", "<CMD>move .-2<CR>")
map("x", "<C-j>", ":move '>+1<CR>gv=gv")
map("x", "<C-k>", ":move '<-2<CR>gv=gv")
