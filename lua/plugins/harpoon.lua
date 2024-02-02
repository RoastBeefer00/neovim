return {
    'theprimeagen/harpoon',
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

        vim.keymap.set("n", "<C-A-m>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<C-A-n>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<C-A-e>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<C-A-i>", function() ui.nav_file(4) end)
    end
}

