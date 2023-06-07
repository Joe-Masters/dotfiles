local status_ok, plugin = pcall(require, "Comment")
if not status_ok then
	return
end

local comment = plugin
comment.setup {
    pre_hook = function(ctx)
	local utils = require("Comment.utils")

	local location = nil
	local is_block = ctx.ctype == utils.ctype.block
	local is_visual = ctx.cmotion == utils.cmotion.v
	local is_visual_line = ctx.cmotion == utils.cmotion.V
	if is_block then
		location = require("ts_context_commentstring.utils").get_cursor_location()
	elseif is_visual or is_visual_line then
	    location = require("ts_context_commentstring.utils").get_visual_start_location()
	end
	return require("ts_context_commentstring.internal").calculate_commentstring {
	    key = ctx.ctype == utils.ctype.line and "__default" or "__multiline",
	    location = location,
	}
    end,
    toggler = {
	line = "<C-/>",
	block = "<C-? ",
    },
    opleader = {
	line = "<C-/>",
	block = "<C-? ",
    }
}
