return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local map = vim.keymap
            map.set('n', '<leader>ff', '<cmd> Telescope find_files <CR>')
            map.set('n', '<leader>fg', '<cmd> Telescope live_grep <CR>')
            map.set('n', '<leader>fr', '<cmd> Telescope oldfiles <CR>')
            map.set('n', '<leader>fb', '<cmd> Telescope buffers <CR>')
            map.set('n', '<leader>fh', '<cmd> Telescope help_tags <CR>')

            local telescope_actions = require('telescope.actions')
            require('telescope').setup({
                pickers = {
                    find_files = {
                        find_command = {
                            'rg',
                            '--files',
                            '--hidden',
                            '--no-ignore-vcs',
                            '--glob',
                            '!.git/**',
                        },
                    },
                },
                mappings = {
                    i = {
                        ['<C-n>'] = telescope_actions.move_selection_next,
                        ['<C-p>'] = telescope_actions.move_selection_previous,
                        ['<C-c>'] = telescope_actions.close,
                        ['<Down>'] = telescope_actions.move_selection_next,
                        ['<Up>'] = telescope_actions.move_selection_previous,
                        ['<CR>'] = telescope_actions.select_default,
                        ['<C-x>'] = telescope_actions.select_horizontal,
                        ['<C-v>'] = telescope_actions.select_vertical,
                        ['<C-t>'] = telescope_actions.select_tab,
                        ['<C-u>'] = telescope_actions.preview_scrolling_up,
                        ['<C-d>'] = telescope_actions.preview_scrolling_down,
                        ['<PageUp>'] = telescope_actions.results_scrolling_up,
                        ['<PageDown>'] = telescope_actions.results_scrolling_down,
                        ['<Tab>'] = telescope_actions.toggle_selection
                            + telescope_actions.move_selection_worse,
                        ['<S-Tab>'] = telescope_actions.toggle_selection
                            + telescope_actions.move_selection_better,
                        ['<C-q>'] = telescope_actions.send_to_qflist
                            + telescope_actions.open_qflist,
                        ['<M-q>'] = telescope_actions.send_selected_to_qflist
                            + telescope_actions.open_qflist,
                        ['<C-l>'] = telescope_actions.complete_tag,
                        ['<C-/>'] = telescope_actions.which_key,
                        ['<C-_>'] = telescope_actions.which_key,
                        ['<C-w>'] = { '<c-s-w>', type = 'command' },
                        ['<C-j>'] = telescope_actions.nop,
                    },
                    n = {
                        ['<esc>'] = telescope_actions.close,
                        ['<CR>'] = telescope_actions.select_default,
                        ['<C-x>'] = telescope_actions.select_horizontal,
                        ['<C-v>'] = telescope_actions.select_vertical,
                        ['<C-t>'] = telescope_actions.select_tab,
                        ['<Tab>'] = telescope_actions.toggle_selection
                            + telescope_actions.move_selection_worse,
                        ['<S-Tab>'] = telescope_actions.toggle_selection
                            + telescope_actions.move_selection_better,
                        ['<C-q>'] = telescope_actions.send_to_qflist
                            + telescope_actions.open_qflist,
                        ['<M-q>'] = telescope_actions.send_selected_to_qflist
                            + telescope_actions.open_qflist,
                        ['j'] = telescope_actions.move_selection_next,
                        ['k'] = telescope_actions.move_selection_previous,
                        ['H'] = telescope_actions.move_to_top,
                        ['M'] = telescope_actions.move_to_middle,
                        ['L'] = telescope_actions.move_to_bottom,
                        ['<Down>'] = telescope_actions.move_selection_next,
                        ['<Up>'] = telescope_actions.move_selection_previous,
                        ['gg'] = telescope_actions.move_to_top,
                        ['G'] = telescope_actions.move_to_bottom,
                        ['<C-u>'] = telescope_actions.preview_scrolling_up,
                        ['<C-d>'] = telescope_actions.preview_scrolling_down,
                        ['<PageUp>'] = telescope_actions.results_scrolling_up,
                        ['<PageDown>'] = telescope_actions.results_scrolling_down,
                        ['?'] = telescope_actions.which_key,
                    },
                },
            })
        end,
    },
}
