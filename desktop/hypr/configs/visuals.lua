hl.env('XCURSOR_THEME', 'Simp1e-Tokyo-Night-Light')
hl.env('XCURSOR_SIZE', '24')

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        float_gaps = 10,

        border_size = 1,
        col = {
            active_border = 'rgb(40414b)',
            inactive_border = 'rgb(40414b)',
        },
    },

    decoration = {
        rounding = 10,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 10,
            render_power = 2,
            color = 'rgba(1a1a1aee)',
        },

        blur = {
            enabled = true,
            size = 8,
            passes = 2,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})
