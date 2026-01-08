return {
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    version = '*',
    event = 'VeryLazy',
    priority = 1000,
    config = function()
      require('tiny-inline-diagnostic').setup({
        preset = 'powerline',
        disabled_ft = {}, -- Disabled for the assigned file types

        -- Filter diagnostics by severity levels
        -- Remove severities you don't want to display
        severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.INFO,
            vim.diagnostic.severity.HINT,
        },

        options = {
          multilines = { enabled = true },
          show_source = { enabled = true },
          add_messages = {
            display_count = true,
          },
        },
      })
      vim.diagnostic.config({ virtual_text = false })
    end,
  },
}
