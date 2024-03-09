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

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

return require('packer').startup(function(use)
    --packer
    use 'wbthomason/packer.nvim'

    --Theme
    -- use 'folke/tokyonight.nvim'
    -- use 'navarasu/onedark.nvim'

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

    --NvimTree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {}
        end
    }

    --bufferline
    use {
        'akinsho/bufferline.nvim', 
        tag = "*", 
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use({
      'glepnir/galaxyline.nvim',
      branch = 'main',
      -- some optional icons
      requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    })

    --autopairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    --installer
    use { "nvim-treesitter/nvim-treesitter" }

    --commenter
    use 'scrooloose/nerdcommenter'

    --ClangFormat
    use "rhysd/vim-clang-format"

    --lsp
    use "neoclide/coc.nvim"

    --airline
    --use "vim-airline/vim-airline"
    --use 'vim-airline/vim-airline-themes'

    --Aerial
    use {
        'stevearc/aerial.nvim',
        config = function() require('aerial').setup() end
    }

    -- smooth scroll
    use "psliwka/vim-smoothie"

    --terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
        end
    }

    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
