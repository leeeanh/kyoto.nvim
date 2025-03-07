local g = vim.g

-- Ignore for indent levels
g.indent_blankline_filetype_exclude = {
  "help",
  "packer",
  "dashboard",
  "nvim-tree",
}

-- Ignore for indent levels
g.indent_blankline_buftype_exclude = { "terminal", "nofile" }

g.mapleader = " "

-- extra plugins to install (must only be strings)
g.kyoto_extra_plugins = {}

-- Configs for LSPs
g.lsp_config = {
  lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
}

-- COQ-nvim completion config
g.coq_settings = {
  auto_start = "shut-up",
  keymap = {
    jump_to_mark = "<c-q>",
    recommended = false
  },
  clients = {
    tags = {
        enabled = true,
    },
    tree_sitter = {
        enabled = false,
    },
    buffers = {
        same_filetype = true,
    },
    tmux = {
        enabled = false,
    },
    tabnine = {
        enabled = false,
    },
    snippets = {
        -- Don't bother about snippets
        warn = {},
    },
  },
}

-- UI CONFIGS
g.kyotorc_ui = {
  -- find a list of themes at https://github.com/NvChad/nvim-base16.lua/tree/master/lua/themes
  theme = "tokyonight",
  -- Find a list of options at lua/statusline.lua(icon_styles var)
  statusline_style = "arrow",
  -- transparent = true,
}

-- uncomment this out if you are experiencing issues with nvim-tree.lua
-- g.nvim_tree_git_hl = 0
-- g.nvim_tree_gitignore = 0
-- g.nvim_tree_show_icons = {
--   git = 0,
--   folders = 1,
--   files = 1
-- }
