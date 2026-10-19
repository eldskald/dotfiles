vim.api.nvim_create_autocmd('BufNewFile', {
    pattern = '*.hlsl',
    command = 'set ft=hlsl',
})
vim.api.nvim_create_autocmd('BufRead', {
    pattern = '*.hlsl',
    command = 'set ft=hlsl',
})
vim.api.nvim_create_autocmd('BufNewFile', {
    pattern = '*.hlsli',
    command = 'set ft=hlsl',
})
vim.api.nvim_create_autocmd('BufRead', {
    pattern = '*.hlsli',
    command = 'set ft=hlsl',
})
