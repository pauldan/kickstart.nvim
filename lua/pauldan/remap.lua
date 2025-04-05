vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- move selected lines around
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- keep the cursor to the center of the screen
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- delete to void and pasteover
vim.keymap.set('x', '<leader>pp', [["_dP]])

-- copy to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])
-- delete to void
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- format whole file
vim.keymap.set('n', '<A-f>', 'ggVG=')

vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n', '<leader>ee', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>')
vim.keymap.set('n', '<leader>ep', 'oif err != nil {<CR>}<Esc>Olog.Panic(err)<Esc>')
vim.keymap.set('n', '<leader>pp', 'o<?php<CR>?><Esc>')
