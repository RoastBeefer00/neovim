return {
    "vonheikemen/fine-cmdline.nvim",
    dependendies = {
        { 'MunifTanjim/nui.nvim' }
    },
    config = function()
        vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
    end
}
