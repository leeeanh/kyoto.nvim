local M = {}
local vim = vim
local g = vim.g

local present, tree_c = pcall(require, "nvim-tree.config")
  if not present then
    return
  end

local tree_cb = tree_c.nvim_tree_callback

function M.setup()
  local config = {
    setup = {
      open_on_setup = false,
      auto_close = true,
      update_cwd = true,
      open_on_tab = false,
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = 30,
        side = "left",
        auto_resize = false,
        mappings = {
          custom_only = false,
          list = {
            { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
            { key = "h", cb = tree_cb "close_node" },
            { key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb("cd") },
            { key = "v", cb = tree_cb("vsplit") },
            { key = "x", cb = tree_cb("split") },
            { key = "<C-t>", cb = tree_cb("tabnew") },
            { key = "H", cb = tree_cb("toggle_dotfiles") },
            { key = "R", cb = tree_cb("refresh") },
            { key = "x", cb = tree_cb("cut") },
            { key = "gc", cb = tree_cb("copy") },
            { key = "p", cb = tree_cb("paste") },
            { key = "y", cb = tree_cb("copy_name") },
            { key = "Y", cb = tree_cb("copy_path") },
            { key = "gy", cb = tree_cb("copy_absolute_path") },
            { key = "-", cb = tree_cb("dir_up") },
            { key = "q", cb = tree_cb("close") },
            { key = "?", cb = tree_cb("toggle_help") },
          }
        },
      },
    },
  }

  g.nvim_tree_gitignore = 1
  g.nvim_tree_auto_ignore_ft = { "dashboard" } -- don't open tree on specific fiypes.
  g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened
  g.nvim_tree_indent_markers = 1
  g.nvim_tree_git_hl = 1
  g.nvim_tree_highlight_opened_files = 0
  g.nvim_tree_root_folder_modifier = table.concat({
    ":t:gs?$?/..",
    string.rep(" ", 1000),
    "?:gs?^??",
  })
  g.nvim_tree_allow_resize = 1
  g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names

  g.nvim_tree_icons = {
    default = "",
      symlink = "",
      git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
      },
      folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
      },
  }
  -- hide statusline when nvim tree is opened
  vim.cmd(
    [[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif]]
  )

  require("nvim-tree").setup(config.setup)
end

return M
