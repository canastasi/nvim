------------------------------------------------
--                                            --
--    This is a main configuration file for    --
--                    EcoVim                  --
--      Change variables which you need to    --
--                                            --
------------------------------------------------

local icons = require("utils.icons")

-- Function to check if Neovim was launched with a file argument
--local function has_file_argument()
--  return vim.fn.argc() > 0 and vim.fn.argv(0) ~= ''
--end

-- Automatically open NvimTree if a file argument is provided
--if has_file_argument() then
--  vim.cmd[[autocmd VimEnter * NvimTreeToggle]]
--end

-- Default to darcula unless the NEOVIM_THEME env var is set
function get_env_var(name)
	local value = os.getenv(name)
	return value ~= nil and value or "darcula"
end
local color_scheme = get_env_var("NEOVIM_THEME")

EcoVim = {
	colorscheme = color_scheme,
	ui = {
		float = {
			border = "rounded",
		},
	},
	plugins = {
		ai = {
			chatgpt = {
				enabled = false,
			},
			codeium = {
				enabled = false,
			},
			copilot = {
				enabled = true,
			},
			tabnine = {
				enabled = false,
			},
		},
		completion = {
			select_first_on_enter = false,
		},
		-- Completely replaces the UI for messages, cmdline and the popupmenu
		experimental_noice = {
			enabled = true,
		},
		-- Enables moving by subwords and skips significant punctuation with w, e, b motions
		jump_by_subwords = {
			enabled = false,
		},
		rooter = {
			-- Removing package.json from list in Monorepo Frontend Project can be helpful
			-- By that your live_grep will work related to whole project, not specific package
			patterns = { ".git", "package.json", "_darcs", ".bzr", ".svn", "Makefile" }, -- Default
		},
		-- <leader>z
		zen = {
			alacritty_enabled = false,
			kitty_enabled = false,
			wezterm_enabled = true,
			enabled = true, -- sync after change
		},
	},
	-- Please keep it
	icons = icons,
	-- Statusline configuration
	statusline = {
		path_enabled = false,
		path = "relative", -- absolute/relative
	},
	lsp = {
		virtual_text = true, -- show virtual text (errors, warnings, info) inline messages
	},
}
