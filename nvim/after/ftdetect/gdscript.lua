vim.api.nvim_create_autocmd('BufNewFile', {
    pattern = '*.gd',
    command = 'set ft=gdscript',
})
vim.api.nvim_create_autocmd('BufRead', {
    pattern = '*.gd',
    command = 'set ft=gdscript',
})
