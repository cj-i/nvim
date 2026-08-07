vim.keymap.set('n', '<leader>u', require("undotree").open)
vim.keymap.set('n', '<C-s>', ':retab!<CR>', { noremap = true, silent = true, desc = "Retab tabs to spaces" })