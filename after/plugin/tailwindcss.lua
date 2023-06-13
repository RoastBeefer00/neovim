require 'lspconfig'.tailwindcss.setup {
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
}
