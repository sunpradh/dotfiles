--
-- INIT.LUA
--

-- Options
require('settings.options')

-- Plugins (lazy.nvim)
require('settings.lazy')
-- plugins are automatically configured from the folder lua/plugins/

-- Mappings
require('settings.mappings')

-- Theme
require('settings.theme')

-- Autocmds
require('settings.autocmds')

-- the rest of the settings are autoloaded from after/plugin/*.(vim|lua)
