local status_ok, plugin = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"

plugin.setup {
    defaults = {
	