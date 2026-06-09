-- Window commands
hl.bind('SUPER + Q', hl.dsp.window.close())
hl.bind('SUPER + T', hl.dsp.window.float({ action = 'toggle' }))
hl.bind(
    'SUPER + F',
    hl.dsp.window.fullscreen({
        mode = 'maximized',
        action = 'toggle',
    })
)
hl.bind(
    'SUPER + V',
    hl.dsp.window.fullscreen({
        mode = 'fullscreen',
        action = 'toggle',
    })
)
hl.bind('SUPER + B', hl.dsp.window.pin())

-- Move focus with Super + Tab and Shift + Super + Tab
hl.bind('SUPER + Tab', hl.dsp.window.cycle_next({}))
hl.bind('SUPER + SHIFT + Tab', hl.dsp.window.cycle_next({ next = false }))

-- Move focus with Super + hjkl
hl.bind('SUPER + H', hl.dsp.focus({ direction = 'l' }))
hl.bind('SUPER + J', hl.dsp.focus({ direction = 'd' }))
hl.bind('SUPER + K', hl.dsp.focus({ direction = 'u' }))
hl.bind('SUPER + L', hl.dsp.focus({ direction = 'r' }))

-- Move window with Super + Shift + hjkl
hl.bind('SUPER + SHIFT + H', hl.dsp.window.move({ direction = 'l' }))
hl.bind('SUPER + SHIFT + J', hl.dsp.window.move({ direction = 'd' }))
hl.bind('SUPER + SHIFT + K', hl.dsp.window.move({ direction = 'u' }))
hl.bind('SUPER + SHIFT + L', hl.dsp.window.move({ direction = 'r' }))

-- Resize window with Super + Ctrl + hjkl
hl.bind(
    'SUPER + CTRL + H',
    hl.dsp.window.resize({ relative = true, x = -20, y = 0 })
)
hl.bind(
    'SUPER + CTRL + J',
    hl.dsp.window.resize({ relative = true, x = 0, y = 20 })
)
hl.bind(
    'SUPER + CTRL + K',
    hl.dsp.window.resize({ relative = true, x = 0, y = -20 })
)
hl.bind(
    'SUPER + CTRL + L',
    hl.dsp.window.resize({ relative = true, x = 20, y = 0 })
)

-- Switch workspaces with Super + [0-9] and move window to workspace with
-- Super + Shift + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind('SUPER + ' .. key, hl.dsp.focus({ workspace = i }))
    hl.bind('SUPER + SHIFT + ' .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move windows with Super + LMB and dragging
hl.bind('SUPER + mouse:272', hl.dsp.window.drag(), { mouse = true })

-- Launchers
hl.bind(
    'SUPER + R',
    hl.dsp.exec_cmd('qs -c noctalia-shell ipc call launcher toggle')
)
hl.bind('SUPER + S', hl.dsp.exec_cmd('ksysguard'))
hl.bind('SUPER + E', hl.dsp.exec_cmd('dolphin'))
hl.bind('Print', hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- Media keys
hl.bind(
    'XF86AudioRaiseVolume',
    hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'),
    { locked = true, repeating = true }
)
hl.bind(
    'XF86AudioLowerVolume',
    hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'),
    { locked = true, repeating = true }
)
hl.bind(
    'XF86AudioMute',
    hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'),
    { locked = true, repeating = true }
)
hl.bind(
    'XF86AudioMicMute',
    hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'),
    { locked = true, repeating = true }
)
hl.bind(
    'XF86MonBrightnessUp',
    hl.dsp.exec_cmd('brightnessctl -e4 -n2 set 5%+'),
    { locked = true, repeating = true }
)
hl.bind(
    'XF86MonBrightnessDown',
    hl.dsp.exec_cmd('brightnessctl -e4 -n2 set 5%-'),
    { locked = true, repeating = true }
)
hl.bind('XF86AudioNext', hl.dsp.exec_cmd('playerctl next'), { locked = true })
hl.bind(
    'XF86AudioPause',
    hl.dsp.exec_cmd('playerctl play-pause'),
    { locked = true }
)
hl.bind(
    'XF86AudioPlay',
    hl.dsp.exec_cmd('playerctl play-pause'),
    { locked = true }
)
hl.bind(
    'XF86AudioPrev',
    hl.dsp.exec_cmd('playerctl previous'),
    { locked = true }
)
-- Move workspace with touchpad, three fingers horizontal movement
hl.gesture({
    fingers = 3,
    direction = 'horizontal',
    action = 'workspace',
})
