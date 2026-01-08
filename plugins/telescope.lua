local t = require('telescope.builtin')

return {
  {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
      { '<leader>ff', t.find_files, { desc = 'Telescope find files' } },
      { '<C-p>', t.git_files, { desc = 'Telescope git files' } },
      { '<leader>fg', t.live_grep, { desc = 'Telescope live grep' } },
      { '<leader>fb', t.buffers, { desc = 'Telescope buffers' } },
      { '<leader>fh', t.help_tags, { desc = 'Telescope help tags' } },
    },
    config = function()
      require('telescope').load_extension('ui-select')
    end
  }
}
