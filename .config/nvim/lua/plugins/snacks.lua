return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy     = false,
    keys     = {
        { "<C-f>", function () Snacks.picker.files() end, desc = "Files" },
        { "<C-g>", function () Snacks.picker.grep() end,  desc = "Grep" },
        { "<C-h>", function () Snacks.picker.help() end,  desc = "Help" },
    },
    opts     = {
        picker = {
            enabled   = true,
            ui_select = false,
            win       = {
                input = {
                    keys = {
                        ["<Esc>"] = { "close", mode = { "n", "i" } },
                        ["<C-c>"] = "close",
                        ["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
                        ["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
                        ["<C-v>"] = { "edit_vsplit", mode = { "i", "n" } },
                        ["<C-s>"] = { "edit_split", mode = { "i", "n" } },
                        ["<C-t>"] = { "edit_tab", mode = { "i", "n" } },
                    },
                },
            },
        },
    },
    init     = function ()
        vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "SnacksPickerFile" })
    end
}
