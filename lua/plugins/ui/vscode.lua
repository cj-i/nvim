vim.pack.add({
  { src = "https://github.com/mofiqul/vscode.nvim", name = "vscode" },
})

vim.o.background = "dark"

require('vscode').setup({
  transparent = false,
  italic_comments = true,
  disable_nvim_tree_bg = true,
})