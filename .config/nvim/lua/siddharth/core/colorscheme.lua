-- set colorscheme to nightfly with protected call
-- in case it isn't installed
--
local setup, tokyonight = pcall(require, "tokyonight")
if not setup then
	return
end

local status, _ = pcall(vim.cmd, "colorscheme tokyonight-storm")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

tokyonight.setup({
	style = "storm",
	transparent = true,
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
})
