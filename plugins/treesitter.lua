return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function(_, opts)
      require'nvim-treesitter'.install {
        'c',
        'fish',
        'javascript',
        'json',
        'lua',
        'python',
        'query',
        'rust',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
      }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'lua' },
        callback = function()
          vim.treesitter.start()

          -- Folding shortcuts
          -- za, zA, zc, zo, zi, zM, zR
          vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.opt.foldmethod = 'expr'

          vim.opt.foldenable = false
          vim.opt.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end
  }
}
