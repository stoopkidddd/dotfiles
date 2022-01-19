local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local function packer_verify()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    cmd 'packadd packer.nvim'
  end
end

local function packer_startup()
    if packer == nil then
      packer = require'packer'
      packer.init()
    end
  
    local use = packer.use
    packer.reset()
  
    -- Packer
    use 'wbthomason/packer.nvim'
  
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'folke/tokyonight.nvim'
    use 'nvim-treesitter/nvim-treesitter' 
    use 'tpope/vim-commentary'
    use 'voldikss/vim-floaterm'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'ThePrimeagen/git-worktree.nvim'
    use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
      "blackCauldron7/surround.nvim",
      config = function()
        require"surround".setup {mappings_style = "surround"}
      end
    }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function() require'nvim-tree'.setup {
        view = {
          width = 5,
          auto_resize = true
        }
      } end
    }
  end
  
  local function init()
    packer_verify()
    packer_startup()
  end
  
  return {
    init = init
  }