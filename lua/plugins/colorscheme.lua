-- return { -- You can easily change to a different colorscheme.
--   -- Change the name of the colorscheme plugin below, and then
--   -- change the command in the config to whatever the name of that colorscheme is.
--   --
--   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--   'folke/tokyonight.nvim',
--   priority = 1000, -- Make sure to load this before all the other start plugins.
--   config = function()
--     ---@diagnostic disable-next-line: missing-fields
--     require('tokyonight').setup {
--       styles = {
--         comments = { italic = true }, -- Enable/Disable italics in comments
--       },
--     }
--     -- Load the colorscheme here.
--     -- Like many other themes, this one has different styles, and you could load
--     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--     vim.cmd.colorscheme 'tokyonight-night'
--   end,
-- }

-- return {
--   'oxfist/night-owl.nvim',
--   lazy = false, -- set to false to make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function(_, opts)
--     local night_owl = require 'night-owl'
--     night_owl.setup {
--       bold = true,
--       italics = true,
--       underline = true,
--       undercurl = true,
--       transparent_background = true,
--     }
--     -- TODO:Setting the background colour of the notify popup no longer works since Lazyvim changed
--     -- to use `Snacks` instead of `notify`. I have to figure out how to change the background.
--     -- require("notify").setup(vim.tbl_extend("keep", {
--     --   background_colour = "#f4c284",
--     -- }, opts))
--     -- vim.cmd.colorscheme("night-owl")
--     -- Change the background colour of the currently selected line
--     -- vim.cmd [[highlight CursorLine guibg=#dddddd]] -- NOT WORKING
--     vim.cmd.colorscheme 'night-owl'
--   end,
-- }

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      transparent_background = true,
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
