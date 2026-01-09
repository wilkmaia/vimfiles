local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local make_entry = require 'telescope.make_entry'
local conf = require 'telescope.config'.values
local sorters = require 'telescope.sorters'

local M = {}

local default_pieces_splitter = '  ' -- Two spaces

M.live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd() ---@diagnostic disable-line: undefined-field
  opts.splitter = opts.splitter or default_pieces_splitter

  local finder = finders.new_async_job({
    command_generator = function(prompt)
      if not prompt or prompt == '' then
        return nil
      end

      local pieces = vim.split(prompt, opts.splitter)
      local args = { 'rg' }
      if pieces[1] then
        table.insert(args, '-e')
        table.insert(args, pieces[1])
      end

      if pieces[2] then
        table.insert(args, '-g')
        table.insert(args, pieces[2])
      end

      return vim.tbl_flatten({ ---@diagnostic disable-line: deprecated
        args,
        {
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
        },
      })
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  })

  pickers.new(opts, {
    debounce = 100,
    prompt_title = 'Multi Grep',
    previewer = conf.grep_previewer(opts),
    finder = finder,
    sorters = sorters.empty(),
  }):find()
end

return M
