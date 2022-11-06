local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
    ensure_installed = {
	"bash",
	"c",
	"cmake",
	"cpp",
	"dockerfile",
	"html",
	"javascript",
	"json",
	"lua",
	"make",
	"markdown",
	"python",
	"toml",
	"typescript",
	"yaml",
    },
    sync_install = false,
    ignore_install = { "" },
    highlight = {
	enable = true, -- Setting to false disables treesitter
	disable = { "" }, -- disable list of languages
	additional_vim_regex_highlighting = true,
    },
    indent = { enable = true },
    rainbow = {
	enable = true,
	extended_mode = true,
	max_file_lines = nil,
    },
}
