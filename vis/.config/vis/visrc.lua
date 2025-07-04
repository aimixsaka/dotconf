-- load standard vis module, providing parts of the Lua API
require("vis")
require("vis-ctags")
--require('edconf')

function dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

-- Custom Options --
vis.events.subscribe(vis.events.INIT, function()
  vis:command('set shell /bin/bash')
  --vis:command('map normal <Space><Space> :w *')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
  -- Your per window configuration options e.g.
  vis:command('set number')
  vis:command('set relativenumber')
  if vis.win.file.name and (vis.win.file.name:match('[^/]*.janet') or vis.win.file.name:match('[^/]*.lua')) then
    vis:command('set tabwidth 2')
    vis:command('set expandtab')
  end
end)

-- Custom Commands --
vis:command_register('xa', function(argv, force, win, selection, range)
  vis:command('X/.*/wq')
end, 'Save and quit all buffers.')

vis:command_register("get", function(argv, force, win, selection, range)
	vis:info(load('return ' .. table.concat(argv, ' '))())
end, "eval give lua code")
