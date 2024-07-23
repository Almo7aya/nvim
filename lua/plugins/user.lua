-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup {
        inverse = false,
        palette_overrides = {
          dark1 = "#232323",
          dark2 = "#666666",
          bright_aqua = "#83a598",
          bright_green = "#adb026",
          gray = "#5c6370",
        },
        overrides = {
          Comment = { fg = "#5c6370", italic = true, bold = true },
          Function = { link = "GruvboxOrangeBold" },
          Whitespace = { fg = "#4b5263" },
          BufferCurrent = { bg = "#5c6370" },
          StatusLine = { fg = "#ebdbb2", bg = "#282828", reverse = false },
        },
      }
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      opts.current_line_blame = true
      print(vim.inspect(opts))
      return opts
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.close_if_last_window = true
      opts.filesystem.filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      }
      opts.window.mappings["<S-j>"] = "prev_source"
      opts.window.mappings["<S-k>"] = "next_source"
      opts.window.position = "right"
      return opts
    end,
  },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.show_help = false
      opts.show_keys = false
    end,
  },
}
