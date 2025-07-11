local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local previewers = require('telescope.previewers')

local find_dirs = function(opts)
    opts = opts or {}
    pickers
        .new(opts, {
            prompt_title = 'Find Directories',
            finder = finders.new_oneshot_job({ 'fd', '-t=d' }, opts),
            sorter = conf.generic_sorter(opts),
            previewer = previewers.new_termopen_previewer({
                title = 'Directory Preview',
                get_command = function(entry, _)
                    return { 'ls', '-1', entry.value }
                end,
            }),
        })
        :find()
end

return require('telescope').register_extension({
    exports = { find_dirs = find_dirs },
})
