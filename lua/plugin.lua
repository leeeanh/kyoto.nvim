local cmd = vim.cmd

cmd("packadd packer.nvim")

local present, packer = pcall(require, "packer")

if not present then
  local packer_path = vim.fn.stdpath("data")
    .. "/site/pack/packer/opt/packer.nvim"

  print("Cloning packer..")
  -- remove the dir before cloning
  vim.fn.delete(packer_path, "rf")
  vim.fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    "--depth",
    "20",
    packer_path,
  })

  cmd("packadd packer.nvim")
  present, packer = pcall(require, "packer")

  if present then
    print("Packer cloned successfully.")
  else
    error(
      "Couldn't clone packer !\nPacker path: " .. packer_path .. "\n" .. packer
    )
  end
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
    prompt_border = "single",
  },
  git = {
    clone_timeout = 600, -- Timeout, in seconds, for git clones
  },
  auto_clean = true,
  compile_on_sync = true,
  -- compile_path = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
  compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  --    auto_reload_compiled = true
})

local vim = vim
require("packer").startup(function(use)
  use 'lewis6991/impatient.nvim'
  use("nathom/filetype.nvim")
  use("wbthomason/packer.nvim")
  use({
    "NvChad/nvim-base16.lua",
  })
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function ()
      require("plugins.nvimtree").setup()
    end
  })
  use("kabouzeid/nvim-lspinstall")
  use({
    "nvim-treesitter/nvim-treesitter",
    branch = "0.5-compat",
    config = function()
      require("plugins.tree-sitter")
    end
  })
  use("neovim/nvim-lspconfig")
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  })
  use({
    "akinsho/nvim-bufferline.lua",
    requires = "kyazdani42/nvim-web-devicons",
  })
  use({
    "windwp/nvim-autopairs",
    config = function ()
      require("plugins.autopairs").setup()
    end
  })
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })
  use({
    "glepnir/dashboard-nvim",
    opt = true,
    cmd = {
      "Dashboard",
      "DashboardChangeColorscheme",
      "DashboardFindFile",
      "DashboardFindHistory",
      "DashboardFindWord",
      "DashboardJumpMarks",
      "DashboardNewfile",
    },
  })
  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })
  use("folke/which-key.nvim")
  use({
    "numToStr/Comment.nvim",
    config = function()
        require('Comment').setup()
    end
  })
  -- use("kdheepak/lazygit.nvim")
  use("p00f/nvim-ts-rainbow")
  use("famiu/feline.nvim")
  use({
    "creativenull/diagnosticls-configs-nvim",
    opt = true,
  })
  use(
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("plugins.blankline").config()
    end,
    event = "BufRead",
  }
  )

  use("ms-jpq/coq_nvim")
  use("ms-jpq/coq.artifacts")
  use("ms-jpq/coq.thirdparty")
  for _, plugin in ipairs(vim.g.kyoto_extra_plugins) do
    use(plugin)
  end
end
)
