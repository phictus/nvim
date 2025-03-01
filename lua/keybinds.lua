local function map(m, k, v)
    vim.keymap.set(m, k, v, {silent = true})
end

-- Telescope keybindings
map("n", "<Leader>ff", "<CMD>Telescope find_files find_command=rg,--files<CR>")
map("n", "<Leader>fs", "<CMD>Telescope live_grep<CR>")
map("n", "<Leader>fd", "<CMD>Telescope diagnostics<CR>")
map("n", "<Leader>h", "<CMD>Telescope file_browser<CR>")
map("n", "<Leader>b", "<CMD>Telescope buffers<CR>")

-- Go to definition
map("n", "<Leader>d", "<CMD>lua vim.lsp.buf.definition()<CR>")

-- Fix n and N. Keeping cursor in center
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Exit highlighting in search
map("n", "<C-n>", "<CMD>noh<CR>");

-- Delete buffer
map("n", "<Leader>d", "<CMD>bp|bd#<CR>")

-- Split stretch
map("n", "<A-.>", "<C-w>2+")
map("n", "<A-,>", "<C-w>5>")

-- Exit TERMINAL mode
map("t", "<Esc>", "<C-\\><C-n>")

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map("n", "<C-j>", "<CMD>move .+1<CR>")
map("n", "<C-k>", "<CMD>move .-2<CR>")
map("x", "<C-j>", ":move '>+1<CR>gv=gv")
map("x", "<C-k>", ":move '<-2<CR>gv=gv")
