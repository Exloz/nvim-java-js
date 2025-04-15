require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

local nomap = vim.keymap.del

nomap("n", "<leader>e")
nomap("n", "<leader>fb")
nomap("n", "<leader>th")
nomap("n", "<Tab>")
nomap("i", "<Tab>")
nomap("i", "<C-j>")
nomap("i", "<C-k>")
-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "H", "^")
map("v", "H", "^")
map("n", "L", "g_")
map("v", "L", "g_")


map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })

-- map("i", "<Tab>", "v:lua.smart_tab()", { expr = true, noremap = true, silent = true })

map({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
map({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
map({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')


map("n", "<leader>fr", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map({ "n", "t" }, "<leader>tt", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

map({ "n", "t" }, "<leader>th", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })
