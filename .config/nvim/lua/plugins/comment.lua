return {
    "numToStr/Comment.nvim",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring"
    },
    opts         = function ()
        return {
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        }
    end,
    init         = function ()
        vim.g.skip_ts_context_commentstring_module = true
    end
}
