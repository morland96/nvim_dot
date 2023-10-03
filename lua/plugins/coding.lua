-- Code related plugins
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
    },
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  -- override nvim-cmp to use copilot and emoji
  {
    "nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "zbirenbaum/copilot-cmp",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "copilot" }, { name = "emoji" } }))
    end,
  },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.defaults = vim.tbl_extend("force", opts.defaults, {
        ["<leader>r"] = { name = "+refactoring" },
        -- ["<leader>d"] = { name = "+debug" },
        -- ["<leader>da"] = { name = "+adapters" },
      })
    end,
  },
  -- Surround
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
  -- LSP
  -- {
  --   "williamboman/mason.nvim",
  --   opts = function(_, opts)
  --     opts.ensure_installed = opts.ensure_installed or {}
  --     vim.list_extend(opts.ensure_installed, { "jdtls@0.57" })
  --   end,
  -- },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      indent = { enable = true, disable = { "yaml", "python", "java"} },
      ensure_installed = {
        "bash",
        "c",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]a"] = { query = "@parameter.inner", desc = "Next parameter" },
            ["]f"] = { query = "@function.outer", desc = "Next function start" },
            ["]c"] = { query = "@conditional.outer", desc = "Next condition start" },
            ["]o"] = "@loop.*",
            ["]l"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["]A"] = { query = "@parameter.inner", desc = "Next parameter" },
            ["]F"] = { query = "@function.outer", desc = "Next function end" },
            ["]C"] = { query = "@class.outer", desc = "Next class end" },
            ["]O"] = "@loop.*",
            ["]L"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]Z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_previous_start = {
            ["[a"] = { query = "@parameter.inner", desc = "Previous parameter" },
            ["[f"] = { query = "@function.outer", desc = "Previous function start" },
            ["[c"] = { query = "@conditional.outer", desc = "Previous condition start" },
            ["[o"] = "@loop.*",
            ["[l"] = { query = "@scope", query_group = "locals", desc = "Previous scope" },
            ["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
          },
          goto_previous_end = {
            ["[A"] = { query = "@parameter.inner", desc = "Previous parameter" },
            ["[F"] = { query = "@function.outer", desc = "Previous function end" },
            ["[C"] = { query = "@class.outer", desc = "Previous class end" },
            ["[O"] = "@loop.*",
            ["[L"] = { query = "@scope", query_group = "locals", desc = "Previous scope" },
            ["[Z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
          },
        },
      },
    },
  },
}
