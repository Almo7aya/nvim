-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        listchars = {
          space = "₋",
          eol = "⤶",
          trail = "~",
          extends = ">",
          precedes = "<",
          tab = "->",
        },
        list = true,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { name = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        ["<S-j>"] = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
        ["<S-k>"] = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        ["<Leader>gm"] = { "<cmd>OpenInGHRepo <cr>", desc = "Open repository in GitHub" },
        ["<Leader>gf"] = { "<cmd>OpenInGHFile <cr>", desc = "Open file in GitHub" },
        -- copy whole file content
        ["<Leader>aa"] = { ":silent :%y+ <CR>", desc = "Copy whole buffer content" },
        ["q"] = { ":noh <cr>", desc = "Disable micro recording thing" },

        -- resize with arrows
        ["<A-k>"] = { ":resize -2<CR>" },
        ["<A-j>"] = { ":resize +2<CR>" },
        ["<A-h>"] = { ":vertical resize -2<CR>" },
        ["<A-l>"] = { ":vertical resize +2<CR>" },
        -- don't yank text on cut ( x )
        ["x"] = { '"_x' },

        ["<leader><leader>"] = { function() require("telescope.builtin").git_status() end, desc = "Find buffers" },
        ["<leader>fg"] = { function() require("telescope.builtin").git_status() end, desc = "Find git files" },
      },

      i = {
        -- Move current line / block with Alt-j/k ala vscode.
        ["<A-j>"] = { "<Esc>:m .+1<CR>==gi" },
        -- Move current line / block with Alt-j/k ala vscode.
        ["<A-k>"] = { "<Esc>:m .-2<CR>==gi" },
      },
      v = {
        ["<Leader>gf"] = { "<cmd>OpenInGHFile <cr>", desc = "Open file in GitHub" },
        -- don't yank text on cut ( x )
        ["x"] = { '"_x' },
        -- don't copy the replaced text after pasting in visual mode
        ["p"] = { '"_dP' },
        -- Better indenting
        ["<"] = { "<gv" },
        [">"] = { ">gv" },
        ["<A-j>"] = { ":m '>+1<CR>gv-gv" },
        ["<A-k>"] = { ":m '<-2<CR>gv-gv" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
