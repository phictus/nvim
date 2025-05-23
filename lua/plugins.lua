local g = vim.g
local cmd = vim.cmd

return {
    -- THEME
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,

        config = function()
            cmd.colorscheme("gruvbox-material")
        end
    },

    -- PARSER
    {
        "nvim-treesitter/nvim-treesitter",

        build = function()
            require("nvim-treesitter.install").update({with_sync = true})()
        end,

        config = function()
            require("nvim-treesitter.install").prefer_git = false
            require("nvim-treesitter.install").compilers = {"clang"}
            require("nvim-treesitter.configs").setup({
                ensure_installed = {"lua", "vim", "vimdoc", "make", "cmake", "c", "cpp", "rust", "asm"},
                highlight = {enable = true, additional_vim_regex_highlighting = false}
            })
        end
    },

    -- TELESCOPE
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",

        dependencies = {
            "nvim-lua/plenary.nvim"
        },
    },

    -- FILE BROWSER
    {
        "stevearc/oil.nvim",
        lazy = false,

        dependencies = {"nvim-tree/nvim-web-devicons"},

        config = function()
            require("oil").setup({
                view_options = {
                    show_hidden = true
                }
            })
        end
    },

    -- STATUS LINE
    {
        "nvim-lualine/lualine.nvim",

        dependencies = {"nvim-tree/nvim-web-devicons"},

        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    icons_enabled = true
                },
                sections = {
                    lualine_a = {"mode"},
                    lualine_b = {"searchcount"},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {"location"}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {}
                }
            })
        end
    },

    -- COMMENTS
    {
        "numToStr/Comment.nvim",

        config = function()
            require("Comment").setup()
        end
    },

    -- AUTOCOMPLETE
    {
        "saghen/blink.cmp",
        version = "*",

        dependencies = {"rafamadriz/friendly-snippets"},

        opts = {
            keymap = {preset = "enter"},
            cmdline = {enabled = false},
            appearance = {
                nerd_font_variant = "normal"
            }
        },
        opts_extend = {"sources.default"}
    },

    -- LANGUAGE SERVER
    {
        "neovim/nvim-lspconfig",
        lazy = false,

        dependencies = {
            "saghen/blink.cmp",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },

        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities();

            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls", "clangd", "rust_analyzer"}
            })

            lspconfig.lua_ls.setup({capabilities = capabilities})

            lspconfig.clangd.setup({
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=never"
                }
            })

            lspconfig.rust_analyzer.setup({capabilities = capabilities})
        end
    }
}
