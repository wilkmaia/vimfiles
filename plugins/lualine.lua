return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    -- @module 'lualine'
    -- @type lualine.Config
    opts = {
      options = {
        theme = 'onedark',
        globalstatus = true,
      },
      sections = {
        lualine_c = {
          { 'filename', path = 1 },
        },
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
          'lsp_status',
        },
        lualine_y = {
          'progress',
          'diagnostics',
        },
      },
      extensions = {
        'fugitive',
        'fzf',
        'nerdtree',
        'quickfix',
        'trouble',
      },
    },
  },
}
