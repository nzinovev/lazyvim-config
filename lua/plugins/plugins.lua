return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    keys = {
      { "<leader>D", "<cmd>DBUI<CR>", desc = "Open DBUI" },
      { "<leader>Dt", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
      { "<leader>DA", "<cmd>DBUIAddConnection<CR>", desc = "Add Database Connection" },
      { "<leader>DF", "<cmd>DBUIFindBuffer<CR>", desc = "Find DBUI Buffer" },
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui_state.vim"
      vim.g.db_ui_winwidth = 50
      vim.g.db_ui_winheight = 15
      vim.g.db_ui_icons = {
        expanded = "▾",
        collapsed = "▸",
        new_connection = "+",
        connection_ok = "✓",
        connection_error = "✕",
      }

      -- паттерн postgres://username:password@host:port/database
      vim.g.db_ui_connection_patterns = {
        ["postgres"] = {
          pattern = "^postgres://(\\w+):(\\w+)@",
          driver = "postgres",
        },
      }
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          extended_mode = true, -- также раскрашивать такие скобки, как квадратные и фигурные
          max_file_lines = 3000,
        },
      })
    end,
  },
}
