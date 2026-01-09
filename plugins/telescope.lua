local t = require('telescope.builtin')
local wim_multigrep = require('wim.plugins.wim.multigrep')

return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
      { '<leader>ff', t.find_files,                 { desc = 'Telescope find files' } },
      { '<C-p>',      t.git_files,                  { desc = 'Telescope git files' } },
      { '<leader>fg', wim_multigrep.live_multigrep, { desc = 'Telescope live grep' } },
      { '<leader>fb', t.buffers,                    { desc = 'Telescope buffers' } },
      { '<leader>fh', t.help_tags,                  { desc = 'Telescope help tags' } },
    },
    config = function()
      require('telescope').load_extension('ui-select')
      require('telescope').load_extension('fzf')
    end
  }
}
