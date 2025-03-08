local function map(m, k, v)
    vim.keymap.set(m, k, v, {silent = true})
end

map("n", "<Leader>gf", "<CMD>Telescope find_files find_command=rg,--files<CR>") -- GO TO FILE
map("n", "<Leader>gs", "<CMD>Telescope live_grep<CR>") -- GO TO SYMBOL
map("n", "<Leader>gb", "<CMD>Telescope buffers<CR>") -- GO TO BUFFER
map("n", "<Leader>gd", "<CMD>lua vim.lsp.buf.definition()<CR>") -- GO TO DEFINITION

map("n", "-", "<CMD>Oil<CR>") -- OIL FILE EXPLORER

-- Fix n and N. Keeping cursor in center
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Exit highlighting in search
map("n", "<C-n>", "<CMD>noh<CR>");

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
