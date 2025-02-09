return {
    -- THEME
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,

        dependencies = {"nvim-tree/nvim-web-devicons"},

        config = function()
            require('nordic').setup({
                italic_comments = true,
                telescope = {
                    -- Available styles: `classic`, `flat`.
                    style = 'flat',
                },
                ts_context = {dark_background = true}
            })
            require('nordic').load()

            require("nvim-web-devicons").setup({
                color_icons = true,
                default = true,
                strict = true
            })
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
                ensure_installed = {"lua", "vim", "vimdoc", "c", "cpp", "rust", "asm"},
                highlight = {enable = true, additional_vim_regex_highlighting = false}
            })
        end
    },

    -- TELESCOPE
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",

        dependencies = {
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-lua/plenary.nvim"
        },

        config = function()
            require("telescope").load_extension("file_browser")
        end
    },

    -- STATUS LINE
    {
        "nvim-lualine/lualine.nvim",

        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    icons_enabled = true
                },
                sections = {
                    lualine_a = {"mode"},
                    lualine_b = {"nvim_treesitter#statusline"},
                    lualine_c = {"searchcount"},
                    lualine_x = {"filename"},
                    lualine_y = {"encoding"},
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

    -- LANGUAGE SERVER
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        priority = 100,

        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",

            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",

            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },

        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<CR>"] = cmp.mapping.confirm({select = true})
                }),
                sources = cmp.config.sources(
                    {
                        {name = "nvim_lsp"},
                        {name = "luasnip"}
                    },
                    {
                        {name = "buffer"}
                    }
                )
            })

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls", "clangd", "rust_analyzer"}
            })

            lspconfig.lua_ls.setup({capabilities = capabilities})
            lspconfig.clangd.setup({capabilities = capabilities})
            lspconfig.rust_analyzer.setup({capabilities = capabilities})
        end
    }
}
