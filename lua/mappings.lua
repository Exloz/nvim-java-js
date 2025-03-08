require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "H", "^")
map("v", "H", "^")
map("n", "L", "g_")
map("v", "L", "g_")

map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
function _G.smart_tab()
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local next_char = line:sub(col, col)
  -- Si el siguiente carácter es ) } ] ' o " se mueve a la derecha, de lo contrario inserta Tab
  if next_char:match("[%]%)%}\"']") then
    return "<Right>"
  else
    return "<Tab>"
  end
end

map("i", "<Tab>", "v:lua.smart_tab()", { expr = true, noremap = true, silent = true })


