local blacklist = { "cssls", "html", "jsonls", "vtsls" }

return {
    "stevearc/conform.nvim",
    cmd  = "ConformInfo",
    keys = {
        {
            "g=",
            function ()
                require("conform").format({
                    filter = function (client)
                        return not vim.tbl_contains(blacklist, client.name)
                    end
                })
            end,
            mode = { "n", "v" },
            desc = "Format Injected Langs",
        },
    },
    opts = {
        default_format_opts = {
            timeout_ms = 3000,
            async      = false,
            quiet      = false,
            lsp_format = "fallback",
        },
        formatters_by_ft    = {
            css             = { "prettier" },
            graphql         = { "prettier" },
            html            = { "prettier" },
            htmlangular     = { "prettier" },
            javascript      = { "prettier" },
            javascriptreact = { "prettier" },
            json            = { "prettier" },
            jsonc           = { "prettier" },
            markdown        = { "prettier" },
            scss            = { "prettier" },
            typescript      = { "prettier" },
            typescriptreact = { "prettier" },
            yaml            = { "prettier" },
        },
        formatters          = {
            injected = {
                options = {
                    ignore_errors = true,
                },
            },
        },
    },
}
