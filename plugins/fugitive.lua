return {
  {
    'tpope/vim-fugitive',
    keys = {
      { '<leader>gs', vim.cmd.Git },
      { '<leader>ggf', '<cmd>Git fetch --all --prune<CR>' },
      { '<leader>grm', '<cmd>Git reset --hard origin/main<CR>' },
    }
  }
}
