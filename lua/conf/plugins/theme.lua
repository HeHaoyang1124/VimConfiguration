--vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme Carbonfox]])

-- vim.cmd([[colorscheme Carbonfox]])

-- require("onedark").setup()

-- require("catppuccin").setup({
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {
                       -- :h background
        light = "latte",
        dark = "mocha",
    },

    transparent_background = true,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },

    no_italic = true,    -- Force no italic
    no_bold = false,      -- Force no bold
    no_underline = false, -- Force no underline
    styles = {
        comments = { "italic" },
        conditionals = { },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    custom_highlights = {},

    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        coc_nvim = true
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },


    highlight_overrides = {
        all = function(colors)
            return {
                NvimTreeNormal = {
                    fg = colors.none,
                    gb = colors.none
                },
                CmpBorder = { fg = "#3e4145" },
            }
        end,
        latte     = function(latte)     return { Normal = { fg = latte.base }, } end,
        frappe    = function(frappe)    return { ["@comment"] = { fg = frappe.surface2, style = { "italic" } }, } end,
        macchiato = function(macchiato) return { LineNr = { fg = macchiato.overlay1 }, } end,
        mocha     = function(mocha)     return { Comment = { fg = mocha.flamingo }, } end,
    },

    native_lsp = {
        enabled = true,
        virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
        },
        underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
        },
        inlay_hints = {
            background = true,
        },
    },
})

require('onedark').setup {
    style = 'warmer',
    transparent_background = true
}


-- -- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
--vim.cmd.colorscheme "gruvbox"
 --vim.cmd.colorscheme "onedark"

local VimExtConfig = [[ highlight Normal guibg=NONE ctermbg=None ]]
vim.cmd(VimExtConfig)


