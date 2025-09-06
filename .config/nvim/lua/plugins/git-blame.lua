return {
    "f-person/git-blame.nvim",
    enabled = false,
    event   = "VeryLazy",
    opts    = {
        enabled             = true,
        message_template    = " <author> - <date> - <summary>",
        date_format         = "%r",
        virtual_text_column = 0
    },
    init    = function ()
        vim.g.gitblame_highlight_group = "NonText"
    end,
}
