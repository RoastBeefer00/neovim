return {
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.5',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require("telescope").setup()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>ft', "<cmd>TodoTelescope<CR>", {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>fs', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)
        end
    },
    "HiPhish/rainbow-delimiters.nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = { "rust", "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                highlight = {
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            })
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {
                'neovim/nvim-lspconfig',
                config = function()
                    local lsp = require("lsp-zero")
                    require('lspconfig').tailwindcss.setup({
                        filetypes = {
                            "css",
                            "scss",
                            "sass",
                            "postcss",
                            "html",
                            "javascript",
                            "javascriptreact",
                            "typescript",
                            "typescriptreact",
                            "svelte",
                            "vue",
                            "rust",
                            "rs"
                        },
                        experimental = {
                            classRegex = {
                                [[class="([^"]*)]],
                                "class=\\s+\"([^\"]*)"
                            },
                        },
                        init_options = {
                            userLanguages = {
                                eelixir = "html-eex",
                                eruby = "erb",
                                rust = "html",
                            },
                        },
                        root_dir = require 'lspconfig'.util.root_pattern('tailwind.config.js', 'tailwind.config.ts',
                            'postcss.config.js',
                            'postcss.config.ts', 'package.json', 'node_modules'),
                    })

                    lsp.preset("recommended")

                    lsp.ensure_installed({
                        'tsserver',
                        'rust_analyzer',
                    })

                    -- Fix Undefined global 'vim'
                    lsp.nvim_workspace()


                    local cmp = require('cmp')
                    local cmp_select = { behavior = cmp.SelectBehavior.Select }
                    local cmp_mappings = lsp.defaults.cmp_mappings({
                        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                        ["<C-Space>"] = cmp.mapping.complete(),
                    })

                    cmp_mappings['<Tab>'] = nil
                    cmp_mappings['<S-Tab>'] = nil

                    lsp.setup_nvim_cmp({
                        mapping = cmp_mappings
                    })

                    lsp.set_preferences({
                        suggest_lsp_servers = false,
                        sign_icons = {
                            error = 'E',
                            warn = 'W',
                            hint = 'H',
                            info = 'I'
                        }
                    })

                    lsp.on_attach(function(client, bufnr)
                        local opts = { buffer = bufnr, remap = false }

                        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                        vim.keymap.set("n", "<leader>K", function() vim.lsp.buf.hover() end, opts)
                        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                    end)

                    lsp.setup()

                    vim.diagnostic.config({
                        virtual_text = true
                    })
                end
            }, -- Required

            {  -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },

    -- TODO: figure out if I need these
    -- 'othree/html5.vim',
    -- 'pangloss/vim-javascript',
    -- 'evanleck/vim-svelte',
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    "sQVe/sort.nvim",
    "christoomey/vim-tmux-navigator",
}
