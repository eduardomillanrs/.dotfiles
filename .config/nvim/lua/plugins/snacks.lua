return {
    "folke/snacks.nvim",
    lazy     = false,
    priority = 1000,
    keys     = {
        { "<C-f>", function () Snacks.picker.files() end,   desc = "Files" },
        { "<C-b>", function () Snacks.picker.buffers() end, desc = "Buffers" },
        { "<C-g>", function () Snacks.picker.grep() end,    desc = "Grep" },
    },
    opts     = {
        lazygit = {
            enabled = true,
        },
        picker  = {
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
            sources   = {
                buffers = {
                    layout = {
                        preset = "select",
                    },
                },
                files = {
                    layout = {
                        preset = "select",
                    },
                },
                grep = {
                    layout = {
                        preset = "vertical",
                    },
                },
            },
        },
    },
    init     = function ()
        vim.api.nvim_create_user_command("Picker", function () Snacks.picker() end, { desc = "Open picker" })
        vim.api.nvim_create_user_command("Git", function () Snacks.lazygit() end, { desc = "Open LazyGit" })
    end
}
