local keymap = vim.keymap

-- General keymaps
keymap.set("n", "<leader>wq", ":wq<CR>") -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>") -- quit without saving
keymap.set("n", "<leader>ww", ":w<CR>") -- save
keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor
-- Quickfix keymaps
-- keymap.set("n", "<leader>qo", ":copen<CR>") -- open quickfix list
-- keymap.set("n", "<leader>qf", ":cfirst<CR>") -- jump to first quickfix list item
-- keymap.set("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
-- keymap.set("n", "<leader>qp", ":cprev<CR>") -- jump to prev quickfix list item
-- keymap.set("n", "<leader>ql", ":clast<CR>") -- jump to last quickfix list item
-- keymap.set("n", "<leader>qc", ":cclose<CR>") -- close quickfix list
--
-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "-", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)

vim.keymap.set("n", "<C-n>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-m>", function() harpoon:list():next() end)

--
-- LSP
-- keymap.set('n', '\\', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- keymap.set('n', '<C-\\>', '<cmd>lua vim.lsp.buf.implementation()<CR>')
-- keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
-- keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<CR>')
-- keymap.set('n', '<leader>td', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
-- keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
-- keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
-- keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
-- keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
-- keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
-- keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
local opts = { noremap = true, silent = true }

-- 📌 Navegación entre definiciones e implementaciones
keymap.set('n', '\\', '<cmd>Telescope lsp_definitions<CR>', opts)   -- Buscar definiciones con Telescope
keymap.set('n', '<C-\\>', '<cmd>Telescope lsp_implementations<CR>', opts) -- Implementaciones con Telescope
keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts) -- Ir a la declaración

-- 📌 Referencias y tipos
keymap.set('n', '<leader>gr', '<cmd>Telescope lsp_references<CR>', opts) -- Buscar referencias con Telescope
-- keymap.set('n', '<leader>td', '<cmd>Telescope lsp_type_definitions<CR>', opts) -- Definición de tipo con Telescope

-- 📌 Ayuda y mejoras de código
-- keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts) -- Mostrar firma de función
keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- Renombrar símbolo
-- keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts) -- Formatear código
keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')

-- 📌 Símbolos del archivo y del workspace con Telescope
keymap.set('n', '<leader>tr', '<cmd>Telescope lsp_document_symbols<CR>', opts) -- Símbolos del documento
keymap.set('n', '<leader>fd', '<cmd>Telescope git_files<CR>', opts)

-- 📌 Diagnósticos con Telescope
keymap.set('n', '<leader>fx', '<cmd>Telescope diagnostics<CR>')

keymap.set('n', '<leader>fe', function()
  require('telescope.builtin').diagnostics({
    severity = vim.diagnostic.severity.ERROR,  -- 🔴 Solo errores
    cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]  -- 📍 Limita la búsqueda al repositorio Git
  })
end, opts)



-- Filetype-specific keymaps (these can be done in the ftplugin directory instead if you prefer)
keymap.set("n", '<leader>go', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').organize_imports();
  end
end)

keymap.set("n", '<leader>gu', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').update_projects_config();
  end
end)

keymap.set("n", '<leader>tc', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_class();
  end
end)

keymap.set("n", '<leader>tm', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_nearest_method();
  end
end)

-- Debugging
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", '<leader>dd', function() require('dap').disconnect(); require('dapui').close(); end)
keymap.set("n", '<leader>dt', function() require('dap').terminate(); require('dapui').close(); end)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end)
keymap.set("n", '<leader>d?', function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end)
keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>')
keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>')
keymap.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({default_text=":E:"}) end)

-- keymap.set({ "n", "t" }, "<C-m>", function()
--   require("nvchad.term").toggle { pos = "sp", id = "watever" }
-- end)

