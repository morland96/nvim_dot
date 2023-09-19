-- Code related plugins
return {
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
        ["<leader>r"] = { name = "+refactoring " },
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
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "html",
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
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]p"] = { query = "@parameter.inner", desc = "Next parameter" },
            ["]f"] = { query = "@function.outer", desc = "Next function start" },
            ["]c"] = { query = "@class.outer", desc = "Next class start" },
            ["]o"] = "@loop.*",
            ["]l"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["]P"] = { query = "@parameter.inner", desc = "Next parameter" },
            ["]F"] = { query = "@function.outer", desc = "Next function end" },
            ["]C"] = { query = "@class.outer", desc = "Next class end" },
            ["]O"] = "@loop.*",
            ["]L"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]Z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_previous_start = {
            ["[p"] = { query = "@parameter.inner", desc = "Previous parameter" },
            ["[f"] = { query = "@function.outer", desc = "Previous function start" },
            ["[c"] = { query = "@class.outer", desc = "Previous class start" },
            ["[o"] = "@loop.*",
            ["[l"] = { query = "@scope", query_group = "locals", desc = "Previous scope" },
            ["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
          },
          goto_previous_end = {
            ["[P"] = { query = "@parameter.inner", desc = "Previous parameter" },
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
