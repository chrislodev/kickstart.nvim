-- Gitsigns configuration with IDE-like appearance (similar to JetBrains/VSCode)
--
-- Uses vertical bars for git changes instead of symbols
-- See `:help gitsigns` for all configuration options
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+', hl = 'GitSignsAdd' },
      change = { text = '▎', hl = 'GitSignsChange' },
      delete = { text = '-', hl = 'GitSignsDelete' },
      topdelete = { text = '‾', hl = 'GitSignsDelete' },
      changedelete = { text = '~', hl = 'GitSignsChange' },
    },
    -- Make the signs appear in the number column to look more like JetBrains/VSCode
    numhl = true,
    -- Add line highlighting like in JetBrains/VSCode
    linehl = false, -- Set to true for full line highlighting (can be distracting)

    -- Show deleted lines with a visual indicator without showing the deleted content
    -- show_deleted = true,

    -- Update signs in the gutter faster
    update_debounce = 100,
    -- Disable inline word diff to prevent automatic previews
    word_diff = false,

    -- Configure blame like JetBrains/VSCode
    current_line_blame = true, -- Toggle with :Gitsigns toggle_current_line_blame

    -- Disable automatic inline previews
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 500, -- in ms
      ignore_whitespace = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    -- Make the signs look better with custom colors and add IDE-like features
    on_attach = function(bufnr)
      -- Set custom highlight colors to match JetBrains/VSCode
      vim.cmd [[
        highlight GitSignsAdd guifg=#4a9c59 gui=bold
        highlight GitSignsChange guifg=#d0a929 gui=bold
        highlight GitSignsDelete guifg=#cb4b16 gui=bold
      ]]

      -- Add hover preview like in JetBrains/VSCode
      -- Shows a preview of the change when hovering over a line with git changes
      local gs = require 'gitsigns'

      -- Map hover preview to show changes when cursor is on a line
      vim.keymap.set('n', '<leader>ghP', function()
        -- Safely call preview_hunk
        pcall(function()
          gs.preview_hunk()
        end)
      end, { buffer = bufnr, desc = 'Preview git hunk' })

      -- Auto-preview on cursor hold is disabled
      -- You can still manually preview changes with <leader>ghP

      -- Add VSCode/JetBrains-like keybindings for common git operations
      -- Using function wrappers with pcall for safety

      -- Stage/unstage the current hunk
      vim.keymap.set('n', '<leader>ghs', function()
        pcall(function()
          gs.stage_hunk()
        end)
      end, { buffer = bufnr, desc = 'Stage git hunk' })

      vim.keymap.set('n', '<leader>ghu', function()
        pcall(function()
          gs.undo_stage_hunk()
        end)
      end, { buffer = bufnr, desc = 'Undo stage git hunk' })

      vim.keymap.set('n', '<leader>ghr', function()
        pcall(function()
          gs.reset_hunk()
        end)
      end, { buffer = bufnr, desc = 'Reset git hunk' })

      -- Toggle current line blame (like JetBrains/VSCode git blame)
      vim.keymap.set('n', '<leader>ghb', function()
        pcall(function()
          gs.blame_line()
        end)
      end, { buffer = bufnr, desc = 'Toggle git blame line' })

      vim.keymap.set('n', '<leader>ghB', function()
        pcall(function()
          gs.blame()
        end)
      end, { buffer = bufnr, desc = 'Toggle git blame' })

      vim.keymap.set('n', ']h', function()
        pcall(function()
          gs.nav_hunk 'next'
        end)
      end, { buffer = bufnr, desc = 'Next hunk' })

      vim.keymap.set('n', '[h', function()
        pcall(function()
          gs.nav_hunk 'prev'
        end)
      end, { buffer = bufnr, desc = 'Prev hunk' })

      -- Toggle deleted line display
      vim.keymap.set('n', '<leader>ghD', function()
        pcall(function()
          gs.preview_hunk_inline()
        end)
      end, { buffer = bufnr, desc = 'Toggle git show deleted' })

      -- Diff view (like JetBrains/VSCode diff view)
      vim.keymap.set('n', '<leader>ghd', function()
        pcall(function()
          gs.diffthis()
        end)
      end, { buffer = bufnr, desc = 'Git diff against index' })
    end,
  },
  -- keys = {
  --   {
  --     ']h',
  --     mode = { 'n', 'v' },
  --     '<cmd>Gitsigns nav_hunk next<cr>',
  --     desc = 'Next hunk',
  --   },
  --   {
  --     '[h',
  --     mode = { 'n', 'v' },
  --     '<cmd>Gitsigns nav_hunk prev<cr>',
  --     desc = 'Prev hunk',
  --   },
  -- },
}
