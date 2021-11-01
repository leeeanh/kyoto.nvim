-- Start screen
require("plugins.dashboard")
-- lualine configuration
require("plugins.statusline")
-- nvim-bufferline.lua configuration
require("plugins.bufferline").setup()
-- fuzzy finder configuration
require("plugins.telescope")
-- Git changes(showing in line number) configuration
require("plugins.gitsigns")
-- configuration to help you remember keybindings
require("plugins.which-key").setup()
-- extra plugins(with shorter configs)
require("plugins.misc")
-- Treesitter configurations
require("plugins.tree-sitter")
-- Error finder configurations
require("plugins.trouble")
-- Third party sources for coq_nvim
require("plugins.coq3p")
