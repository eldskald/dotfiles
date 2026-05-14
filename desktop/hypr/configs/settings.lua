hl.env('QT_QPA_PLATFORMTHEME', 'hyprqt6engine')
hl.env('XDG_MENU_PREFIX', 'arch-')

hl.on('hyprland.start', function()
    hl.exec_cmd('qs -c noctalia-shell')
    hl.exec_cmd('systemctl --user start hyprpolkitagent')
    hl.exec_cmd('udiskie')
end)

hl.config({ ecosystem = { enforce_permissions = true } })
hl.permission({ binary = '/usr/bin/grim', type = 'screencopy', mode = 'allow' })
hl.permission({
    binary = '/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland',
    type = 'screencopy',
    mode = 'allow',
})

hl.config({
    general = {
        resize_on_border = true,
        allow_tearing = false,
        layout = 'dwindle',
    },

    dwindle = {
        preserve_split = true,
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },

    input = {
        kb_layout = 'us',
        kb_variant = 'intl',

        follow_mouse = 2,
        float_switch_override_focus = 0,

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },

    cursor = {
        no_warps = true,
    },
})
