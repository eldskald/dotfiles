vim.api.nvim_create_autocmd('BufNewFile', {
    pattern = '*.tpp',
    command = 'set ft=cpp',
})
vim.api.nvim_create_autocmd('BufRead', {
    pattern = '*.tpp',
    command = 'set ft=cpp',
})
