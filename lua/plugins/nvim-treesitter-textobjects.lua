return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  lazy = true,
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('nvim-treesitter.configs').setup {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['a='] = {
              query = '@assignment.outer',
              desc = 'Select all = assignments around cursor',
            },
            ['i='] = {
              query = '@assignment.inner',
              desc = 'Select all = assignments inside cursor',
            },
            ['l='] = {
              query = '@assignment.lhs',
              desc = 'Select all = assignments left hand side of cursor',
            },
            ['r='] = {
              query = '@assignment.rhs',
              desc = 'Select all = assignments right hand side of cursor',
            },
            ['af'] = {
              query = '@function.outer',
              desc = 'Select outer part of a function',
            },
            ['if'] = {
              query = '@function.inner',
              desc = 'Select inner part of a function',
            },
            ['ac'] = {
              query = '@class.outer',
              desc = 'Select outer part of a class',
            },
            ['ic'] = {
              query = '@class.inner',
              desc = 'Select inner part of a class',
            },
            ['aa'] = {
              query = '@parameter.outer',
              desc = 'Select outer part of a parameter/argument',
            },
            ['ia'] = {
              query = '@parameter.inner',
              desc = 'Select inner part of a parameter/argument',
            },
            ['ai'] = {
              query = '@conditional.outer',
              desc = 'Select outer part of a conditional',
            },
            ['ii'] = {
              query = '@conditional.inner',
              desc = 'Select inner part of a conditional',
            },
            ['al'] = {
              query = '@loop.outer',
              desc = 'Select outer part of a loop',
            },
            ['il'] = {
              query = '@loop.inner',
              desc = 'Select inner part of a loop',
            },
            ['am'] = {
              query = '@comment.outer',
              desc = 'Select outer part of a comment',
            },
            ['im'] = {
              query = '@comment.inner',
              desc = 'Select inner part of a comment',
            },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']f'] = {
              query = '@call.outer',
              desc = 'Next function call start',
            },
            [']c'] = {
              query = '@class.outer',
              desc = 'Next class start',
            },
            [']i'] = {
              query = '@conditional.outer',
              desc = 'Next conditional start',
            },
            [']l'] = {
              query = '@loop.outer',
              desc = 'Next loop start',
            },
          },
          goto_next_end = {
            [']F'] = {
              query = '@call.outer',
              desc = 'Next function call end',
            },
            [']C'] = {
              query = '@class.outer',
              desc = 'Next class end',
            },
            [']I'] = {
              query = '@conditional.outer',
              desc = 'Next conditional end',
            },
            [']L'] = {
              query = '@loop.outer',
              desc = 'Next loop end',
            },
          },
          goto_previous_start = {
            ['[f'] = {
              query = '@call.outer',
              desc = 'Previous function call start',
            },
            ['[c'] = {
              query = '@class.outer',
              desc = 'Previous class start',
            },
            ['[i'] = {
              query = '@conditional.outer',
              desc = 'Previous conditional start',
            },
            ['[l'] = {
              query = '@loop.outer',
              desc = 'Previous loop start',
            },
          },
          goto_previous_end = {
            ['[F'] = {
              query = '@call.outer',
              desc = 'Previous function end',
            },
            ['[C'] = {
              query = '@class.outer',
              desc = 'Previous class end',
            },
            ['[I'] = {
              query = '@conditional.outer',
              desc = 'Previous conditional end',
            },
            ['[L'] = {
              query = '@loop.outer',
              desc = 'Previous loop end',
            },
          },
        },  
      },
    }
  end,
}
