local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

local find_dirs = function(opts)
    opts = opts or {}
    pickers
        .new(opts, {
            prompt_title = 'Find Directories',
            finder = finders.new_oneshot_job({ 'fd', '-t=d' }, opts),
            sorter = conf.generic_sorter(opts),
        })
        :find()
end

return require('telescope').register_extension({
    exports = { find_dirs = find_dirs },
})
