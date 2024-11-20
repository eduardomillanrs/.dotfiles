return {
    {
        "oahlen/iceberg.nvim",
        lazy     = false,
        priority = 1000,
        config   = function ()
            vim.cmd.colorscheme("iceberg")

            local groups = {
                NormalFloat = { bg = "#0F1118" },
                Pmenu       = { bg = "#0F1118" },
                PmenuSbar   = { bg = "#0F1118" },
                PmenuSel    = { bg = "#3C425E" },
                PmenuThumb  = { bg = "#808598" },
            }

            for group, opts in pairs(groups) do
                vim.api.nvim_set_hl(0, group, opts)
            end
        end
    },
}
