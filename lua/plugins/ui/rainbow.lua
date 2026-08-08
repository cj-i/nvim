vim.pack.add({
  { src = "https://github.com/HiPhish/rainbow-delimiters.nvim", name = "rainbow-delimiters" },
})

local colors = {
  { name = "RainbowDelimiterGold",   fg = "#FFD700" },
  { name = "RainbowDelimiterOrchid", fg = "#DA70D6" },
  { name = "RainbowDelimiterBlue",   fg = "#179FFF" }
}

local function set_bracket_colors()
  for _, a in ipairs(colors) do
    vim.api.nvim_set_hl(0, a.name, { fg = a.fg })
  end
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = set_bracket_colors })
set_bracket_colors()

vim.g.rainbow_delimiters = {
  highlight = vim.tbl_map(function(a)
    return a.name
  end, colors)
}
