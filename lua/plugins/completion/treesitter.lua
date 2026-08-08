vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "treesitter" }
})

require("nvim-treesitter").setup({
  highlight = { enable = true },
  indent = { enable = true },
})

require("nvim-treesitter").install({
  "bash",
  "html",
  "css",
  "svelte",
  "latex",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "query",
  "regex",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
  "nix",
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
