return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        { 'neovim/nvim-lspconfig' },
        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },
        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
        -- Linting and formatting
        { 'nvimtools/none-ls.nvim' },
        -- Diagnostics and quickfix
        {
            'folke/trouble.nvim',
            cmd = 'Trouble',
            keys = {
                {
                    '<leader>xx',
                    '<cmd>Trouble diagnostics toggle<cr>',
                    desc = 'Diagnostics (Trouble)',
                },
                {
                    '<leader>xX',
                    '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
                    desc = 'Buffer Diagnostics (Trouble)',
                },
                {
                    '<leader>cs',
                    '<cmd>Trouble symbols toggle focus=false<cr>',
                    desc = 'Symbols (Trouble)',
                },
                {
                    '<leader>cl',
                    '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
                    desc = 'LSP Definitions / references / ... (Trouble)',
                },
                {
                    '<leader>xL',
                    '<cmd>Trouble loclist toggle<cr>',
                    desc = 'Location List (Trouble)',
                },
                {
                    '<leader>xQ',
                    '<cmd>Trouble qflist toggle<cr>',
                    desc = 'Quickfix List (Trouble)',
                },
            },
            opts = {
                icons = {
                    indent = {
                        top = '│ ',
                        middle = '├╴',
                        last = '└╴',
                        -- last          = "-╴",
                        -- last       = "╰╴", -- rounded
                        fold_open = 'v ',
                        fold_closed = '> ',
                        ws = '  ',
                    },
                    folder_closed = 'v ',
                    folder_open = '> ',
                    kinds = {
                        Array = 'array',
                        Boolean = 'bool',
                        Class = 'class',
                        Constant = 'constant',
                        Constructor = 'constructor',
                        Enum = 'enum',
                        EnumMember = 'enum_member',
                        Event = 'event',
                        Field = 'field',
                        File = 'file',
                        Function = 'function',
                        Interface = 'interface',
                        Key = 'key',
                        Method = 'method',
                        Module = 'module',
                        Namespace = 'namespace',
                        Null = 'null',
                        Number = 'number',
                        Object = 'object',
                        Operator = 'operator',
                        Package = 'package',
                        Property = 'property',
                        String = 'string',
                        Struct = 'struct',
                        TypeParameter = 'type',
                        Variable = 'variable',
                    },
                },
            },
        },
    },
    config = function()
        local lsp = require('lsp-zero').preset({
            name = 'minimal',
            manage_nvim_cmp = {
                set_basic_mappings = false,
                set_extra_mappings = false,
            },
        })

        lsp.on_attach(function(_, bufnr)
            local opts = { buffer = bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set(
                'n',
                '<leader>wa',
                vim.lsp.buf.add_workspace_folder,
                opts
            )
            vim.keymap.set(
                'n',
                '<leader>wr',
                vim.lsp.buf.remove_workspace_folder,
                opts
            )
            vim.keymap.set('n', '<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set(
                { 'n', 'v' },
                '<leader>ca',
                vim.lsp.buf.code_action,
                opts
            )
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<leader>fm', function()
                vim.lsp.buf.format({ async = true })
            end, opts)
        end)

        lsp.set_sign_icons({
            error = 'X',
            warn = '!',
            hint = '?',
            info = 'i',
        })

        require('custom.lsp-configs')

        lsp.setup()

        -- Autocompletion
        local cmp = require('cmp')
        local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            mapping = {
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select_opts),
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select_opts),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-i>'] = cmp.mapping.scroll_docs(4),
                ['<Down>'] = cmp.mapping(function(fallback)
                    cmp.close()
                    fallback()
                end, { 'i' }),
                ['<Up>'] = cmp.mapping(function(fallback)
                    cmp.close()
                    fallback()
                end, { 'i' }),
            },
            sources = {
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'buffer', keyword_length = 3 },
                { name = 'luasnip', keyword_length = 2 },
            },
        })

        -- Linters and formatters
        require('null-ls').setup({
            debug = true,
            sources = require('custom.none-ls-sources'),
        })
    end,
}
