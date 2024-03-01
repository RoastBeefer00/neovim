return {
  "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
        local home = vim.fn.expand("$HOME")
        require("chatgpt").setup({
            api_key_cmd = "pass show chatgpt/api/key"
        })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
}
