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
    install = {
        colorscheme = { 'tokyonight' },
    },
    ui = {
        icons = {
            cmd = 'cmd',
            config = 'cfg',
            event = 'ev',
            favorite = 'fav',
            ft = 'ft',
            init = 'init',
            import = 'import',
            keys = 'keys',
            lazy = 'lazy',
            loaded = '+',
            not_loaded = '-',
            plugin = '',
            runtime = 'run',
            require = 'req',
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

require('custom.override')
