require('options')

local lazypath = vim.fn.stdpath('data') .. '/plugins.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins', {
    ui = {
        icons = {
            cmd = 'cmd',
            config = 'cfg',
            event = 'ev',
            ft = 'ft',
            init = 'init',
            import = 'import',
            keys = 'keys',
            lazy = 'lazy',
            loaded = '+',
            not_loaded = '-',
            plugin = '',
            runtime = 'run',
            source = 'src',
            start = 'start',
            task = 'task',
            list = {
                'o',
                '->',
                '*',
                '-',
            },
        },
    },
})
