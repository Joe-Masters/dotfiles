local status_ok, plugin = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

local autopairs = plugin

autopairs.setup {
    check_ts = true,  --ts=treesitter
    ts_config = {
	lua = { "string", "source" },
    	javascript = { "string", "template_string" },
    	java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    -- Suggest and autopair in line of existing text
    -- e.g. things = [ "biscuitq, "spider" ]$
    -- in the example the q and $ show up because we pressed <M-e>
    -- If we now press q, we get a " after biscuit. If we press
    -- $ we get one at the end of the line.
    fast_wrap = {
	map = "<M-e>",
	chars = { "{", "[", "(", '"', "'" },
	pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
	offset = 0,  -- Offset from pattern match
	end_key = "$",
	keys = "qwertyuiopzxcvbnmasdfghjkl",
	check_comma = true,
	highlight = "PmenuSel",
	highlight_grey = "LineNr",
    },
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
