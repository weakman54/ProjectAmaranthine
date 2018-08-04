
-- Easier loading of the module
local modname = (...) and (...):gsub('%.init$', '') .. ".Vector"

return require(modname)