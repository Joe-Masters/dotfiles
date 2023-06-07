local util = require "lspconfig.util"

return {
    default_config = {
	filetypes = { "arduino" },
	root_dir = util.root_pattern "*.ino",
    }
}
