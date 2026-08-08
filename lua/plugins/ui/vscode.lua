vim.pack.add({
  { src = "https://github.com/mofiqul/vscode.nvim", name = "vscode" },
})

require('vscode').setup({
  transparent = false,
  italic_comments = true,
  disable_nvim_tree_bg = true,
})

vim.cmd.colorscheme("vscode")