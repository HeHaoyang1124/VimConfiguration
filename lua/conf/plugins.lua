local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    --packer
    use 'wbthomason/packer.nvim'

    --Launch
    use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        requires = {'nvim-tree/nvim-web-devicons'}
    }
    
    --Gruvbox
    use { "ellisonleao/gruvbox.nvim" }
    --catppuccin
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'navarasu/onedark.nvim'

    --telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        "folke/todo-comments.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }

    --Neotree
    use {
        "nvim-neo-tree/neo-tree.nvim", branch = "v3.x", requires = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    }}

    --bufferline
    use {
        'akinsho/bufferline.nvim', 
        tag = "*", 
        requires = 'nvim-tree/nvim-web-devicons'
    }

    --galaxyline
    use({
      'glepnir/galaxyline.nvim',
      branch = 'main',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    })

    --pairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    --commenter
    use 'scrooloose/nerdcommenter'

    --lsp
    use { "nvim-treesitter/nvim-treesitter" }
    use {'neoclide/coc.nvim', branch= 'release'}
    
    -- smooth scroll / cursor
    use "echasnovski/mini.animate"

    --terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
        end
    }

    --function list
    use {"stevearc/aerial.nvim"}


    if packer_bootstrap then
        require('packer').sync()
    end
end)
