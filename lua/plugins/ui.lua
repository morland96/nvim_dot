return {
  -- Change the window picker's behavior to use floating windows
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "s1n7ax/nvim-window-picker",
      name = "window-picker",
      event = "VeryLazy",
      version = "2.*",
      config = function()
        require("window-picker").setup({
          hint = "floating-big-letter",
          autoselect_one = true,
          include_current = false,
          filter_rules = {
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { "neo-tree", "neo-tree-popup", "notify" },

              -- if the buffer type is one of following, the window will be ignored
              buftype = { "terminal", "quickfix" },
            },
          },
        })
      end,
    },
  },
  -- File Browser
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults = vim.tbl_extend("force", opts.defaults, {
        -- path_display = { "truncate" },
        path_display = { "smart" },
      })
    end,
  },
  -- Bookmarks
  {
    "MattesGroeger/vim-bookmarks",
    -- event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tom-anders/telescope-vim-bookmarks.nvim",
    },
    init = function()
      vim.g.bookmark_no_default_key_mappings = 1
    end,
    config = function()
      require("telescope").load_extension("vim_bookmarks")
    end,
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("harpoon").setup({
        global_settings = {
          save_on_toggle = false,
          save_on_change = true,
        },
      })
      require("telescope").load_extension("harpoon")
      vim.cmd("autocmd FileType harpoon setlocal wrap")
    end,
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        delay = 50,
        animation = function(s, n)
          return 10
        end,
      },
    },
  },
}
