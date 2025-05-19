-- load standard vis module, providing parts of the Lua API
require('vis')
require('vis-ctags')
--require('edconf')

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- Custom Options --
vis.events.subscribe(vis.events.INIT, function()
	vis:command('set shell /bin/bash')
	--vis:command('map normal <Space><Space> :w *')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win) -- luacheck: no unused args
	-- Your per window configuration options e.g.
	vis:command('set number')
	vis:command('set relativenumber')
end)

-- Custom Commands --
vis:command_register('xa', function(argv, force, win, selection, range)
	vis:command('X/.*/wq')
end, 'Save and quit all buffers.')
