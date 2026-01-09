-- General
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<Left>', '<C-w><')
vim.keymap.set('n', '<Right>', '<C-w>>')
vim.keymap.set('n', '<Up>', '<C-w>+')
vim.keymap.set('n', '<Down>', '<C-w>-')

vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv")

vim.keymap.set('x', '<leader>p', '"_dP')
vim.keymap.set({ 'n', 'v' }, '<leader>c', '"+y')
vim.keymap.set('n', '<leader>C', '"+Y')
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')

vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>')
