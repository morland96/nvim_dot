if vim.g.vscode then
  return {}
else
  return {
    {
      "folke/tokyonight.nvim",
      lazy = true,
      opts = {},
      vscode = true,
    },
    { "olimorris/onedarkpro.nvim", priority = 1000, vscode = true },
    -- { "navarasu/onedark.nvim" },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "onedark",
      },
      vscode = true,
    },
  }
end
