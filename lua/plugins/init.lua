return {
    {
      'nvim-telescope/telescope.nvim', version = '0.1.5',
      -- or                            , branch = '0.1.x',
      dependencies = { {'nvim-lua/plenary.nvim'} },
      config = function()
        require("telescope").setup()
      	local builtin = require('telescope.builtin')
      	vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      	vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      	vim.keymap.set('n', '<leader>fs', function()
      		builtin.grep_string({ search = vim.fn.input("Grep > ") });
      	end)
      end
    },
    "HiPhish/nvim-ts-rainbow2",
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
              -- rainbow = {
              --   enable = true,
              --   -- list of languages you want to disable the plugin for
              --   disable = { 'jsx', 'cpp' },
              --   -- Which query to use for finding delimiters
              --   query = 'rainbow-parens',
              --   -- Highlight the entire buffer all at once
              --   strategy = require('ts-rainbow').strategy.global,
              -- }
            })
    end
    },
    'nvim-treesitter/playground',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {
                'neovim/nvim-lspconfig',
                config = function()
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
                      root_dir = require 'lspconfig'.util.root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js',
                        'postcss.config.ts', 'package.json', 'node_modules'),
                    })
	    end
            },             -- Required

            {                                      -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    },

    'othree/html5.vim',
    'pangloss/vim-javascript',
    'evanleck/vim-svelte',
    
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    "numToStr/FTerm.nvim",
    "sQVe/sort.nvim",
    "christoomey/vim-tmux-navigator",
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    },
}n {

}
