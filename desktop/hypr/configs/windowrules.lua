hl.window_rule({ match = { class = 'org.kde.ksysguard' }, float = true })
hl.window_rule({ match = { class = '.*' }, persistent_size = true })

-- Ignore maximize requests from all apps. You'll probably like this.
hl.window_rule({
    name = 'suppress-maximize-events',
    match = { class = '.*' },
    suppress_event = 'maximize',
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name = 'fix-xwayland-drags',
    match = {
        class = '^$',
        title = '^$',
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.layer_rule({
    name = 'noctalia',
    match = { namespace = 'noctalia-background-.*$' },
    blur = true,
    ignore_alpha = 0.5,
    blur_popups = true,
})

hl.layer_rule({
    name = 'ignore-alpha',
    match = { namespace = '*' },
    ignore_alpha = 0.5,
})

-- Hyprland-run windowrule
hl.window_rule({
    name = 'move-hyprland-run',
    match = { class = 'hyprland-run' },
    move = '20 monitor_h-120',
    float = true,
})
