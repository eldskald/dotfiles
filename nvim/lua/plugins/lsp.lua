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
        { 'folke/trouble.nvim' },
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

        -- Configs for lua
        require('lspconfig').lua_ls.setup({
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        enable = false, -- use luacheck only
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file('', true),
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        -- Configs for C/C++
        require('lspconfig').clangd.setup({})

        -- Configs for GLSL
        require('lspconfig').glsl_analyzer.setup({})

        -- Configs for HTML/CSS/JavaScript/TypeScript as well as tailwindcss
        require('lspconfig').tsserver.setup({})
        require('lspconfig').html.setup({})
        require('lspconfig').cssls.setup({})
        require('lspconfig').tailwindcss.setup({})
        require('lspconfig').eslint.setup({})

        -- Configs for GDScript
        require('lspconfig').gdscript.setup({})

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

        -- Linting
        local null_ls = require('null-ls')
        local b = null_ls.builtins

        null_ls.setup({
            debug = true,
            sources = {
                -- Linters
                b.diagnostics.selene,
                -- Formatters
                b.formatting.prettier,
                b.formatting.stylua,
                b.formatting.clang_format,
            },
        })

        -- Diagnostics
        vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>')
        vim.keymap.set(
            'n',
            '<leader>xw',
            '<cmd>TroubleToggle workspace_diagnostics<cr>'
        )
        vim.keymap.set(
            'n',
            '<leader>xd',
            '<cmd>TroubleToggle document_diagnostics<cr>'
        )
        vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>')
        vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>')
        vim.keymap.set('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>')

        require('trouble').setup({
            action_keys = {
                close = 'q',
                cancel = '<Esc>',
                refresh = 'r',
                jump = { '<CR>', '<Tab>' },
                open_split = { '<C-x>' },
                open_vsplit = { '<C-v>' },
                open_tab = { '<C-t>' },
                jump_close = { 'o' },
                toggle_mode = 'm',
                toggle_preview = 'P',
                hover = 'K',
                preview = 'p',
                close_folds = { 'zM', 'zm' },
                open_folds = { 'zR', 'zr' },
                toggle_fold = { 'zA', 'za' },
                previous = 'k',
                next = 'j',
            },
            use_diagnostic_signs = false,
            icons = false,
            fold_open = 'v',
            fold_closed = '>',
            signs = {
                error = 'X',
                warning = '!',
                hint = '?',
                information = 'i',
            },
        })
    end,
}
