return {
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {},
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    },
    {
        'akinsho/bufferline.nvim',
        version = '*',
        config = function()
            require('bufferline').setup({
                options = {
                    indicator = {
                        icon = '>',
                        style = 'icon',
                    },
                    separator_style = { '|', '|' },
                    modified_icon = '*',
                    left_trunc_marker = '<-',
                    right_trunc_marker = '->',
                    show_buffer_icons = false,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                },
            })
            vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>')
            vim.keymap.set('n', '<S-Tab>', '<cmd>bprev<CR>')
        end,
    },
    {
        {
            'goolord/alpha-nvim',
            config = function()
                local alpha = require('alpha')
                local dashboard = require('alpha.themes.dashboard')
                local v = vim.version()
                local dashboard_art = {
                    [[                                                   ]],
                    [[                                              ___  ]],
                    [[                                           ,o88888 ]],
                    [[                                        ,o8888888' ]],
                    [[                  ,:o:o:oooo.        ,8O88Pd8888"  ]],
                    [[              ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    ]],
                    [[            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      ]],
                    [[           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        ]],
                    [[          , ..:.::o:ooOoOO8O888O8O,COCOO"          ]],
                    [[         , . ..:.::o:ooOoOOOO8OOOOCOCO"            ]],
                    [[          . ..:.::o:ooOoOoOO8O8OCCCC"o             ]],
                    [[             . ..:.::o:ooooOoCoCCC"o:o             ]],
                    [[             . ..:.::o:o:,cooooCo"oo:o:            ]],
                    [[          `   . . ..:.:cocoooo"'o:o:::'            ]],
                    [[          .`   . ..::ccccoc"'o:o:o:::'             ]],
                    [[         :.:.    ,c:cccc"':.:.:.:.:.'              ]],
                    [[       ..:.:"'`::::c:"'..:.:.:.:.:.'               ]],
                    [[     ...:.'.:.::::"'    . . . . .'                 ]],
                    [[    .. . ....:."' `   .  . . ''                    ]],
                    [[  . . . ...."'                                     ]],
                    [[  .. . ."'                                         ]],
                    [[ .                                                 ]],
                    [[                                                   ]],
                }
                local nvim_version = v.major .. '.' .. v.minor .. '.' .. v.patch
                local spaces_total = (string.len(dashboard_art[1]) - 13) / 2
                local nvim_centralized = string.rep(' ', spaces_total)
                    .. 'NEOVIM v'
                    .. nvim_version
                table.insert(dashboard_art, nvim_centralized)
                dashboard.section.header.val = dashboard_art
                dashboard.section.buttons.val = {}
                alpha.setup(dashboard.config)
            end,
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            -- Modified Eviline config for lualine,
            -- original by shadmansaleh and glepnir,
            -- modded by eldskald
            local lualine = require('lualine')

      -- stylua: ignore
      local colors = {
        bg       = '#202328',
        fg       = '#bbc2cf',
        yellow   = '#ECBE7B',
        cyan     = '#008080',
        darkblue = '#081633',
        green    = '#98be65',
        orange   = '#FF8800',
        violet   = '#a9a1e1',
        magenta  = '#c678dd',
        blue     = '#51afef',
        red      = '#ec5f67',
      }

            local conditions = {
                buffer_not_empty = function()
                    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
                end,
                hide_in_width = function()
                    return vim.fn.winwidth(0) > 80
                end,
                check_git_workspace = function()
                    local filepath = vim.fn.expand('%:p:h')
                    local gitdir = vim.fn.finddir('.git', filepath .. ';')
                    return gitdir and #gitdir > 0 and #gitdir < #filepath
                end,
            }

            local config = {
                options = {
                    component_separators = '',
                    section_separators = '',
                    theme = {
                        normal = { c = { fg = colors.fg, bg = colors.bg } },
                        inactive = { c = { fg = colors.fg, bg = colors.bg } },
                    },
                },
                sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_y = {},
                    lualine_z = {},
                    lualine_c = {},
                    lualine_x = {},
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_y = {},
                    lualine_z = {},
                    lualine_c = {},
                    lualine_x = {},
                },
            }

            local function ins_left(component)
                table.insert(config.sections.lualine_c, component)
            end

            local function ins_right(component)
                table.insert(config.sections.lualine_x, component)
            end

            ins_left({
                function()
                    return '▊'
                end,
                color = { fg = colors.cyan },
                padding = { left = 0, right = 1 },
            })

            ins_left({
                'branch',
                icons_enabled = false,
                color = { fg = colors.magenta, gui = 'bold' },
            })

            ins_left({
                function()
                    return '|'
                end,
                cond = conditions.buffer_not_empty,
            })

            ins_left({
                'filename',
                cond = conditions.buffer_not_empty,
                color = { gui = 'bold' },
            })

            ins_left({
                function()
                    return ' '
                end,
            })

            ins_left({
                'diff',
                symbols = { added = ' +', modified = ' ~', removed = ' -' },
                diff_color = {
                    added = { fg = colors.green },
                    modified = { fg = colors.orange },
                    removed = { fg = colors.red },
                },
                cond = conditions.hide_in_width,
            })

            ins_left({
                function()
                    return ' '
                end,
            })

            ins_left({
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = {
                    error = ' X ',
                    warn = ' ! ',
                    hint = ' ? ',
                    info = ' i ',
                },
            })

            ins_left({
                function()
                    return '%='
                end,
            })

            ins_right({
                'filetype',
                icons_enabled = false,
                color = { fg = colors.green, gui = 'bold' },
            })

            ins_right({
                function()
                    return '|'
                end,
            })

            ins_right({ 'location' })

            ins_right({
                function()
                    return '|'
                end,
            })

            ins_right({ 'progress', color = { fg = colors.fg, gui = 'bold' } })

            ins_right({
                function()
                    return '▊'
                end,
                color = { fg = colors.cyan },
                padding = { left = 1 },
            })

            lualine.setup(config)
        end,
    },
}
