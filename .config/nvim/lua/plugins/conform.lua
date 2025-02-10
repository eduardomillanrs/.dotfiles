return {
    "stevearc/conform.nvim",
    lazy = true,
    cmd  = "ConformInfo",
    keys = {
        {
            "g=",
            function ()
                require("conform").format({
                    filter = function (client)
                        local blacklist = { "cssls", "html", "jsonls", "volar", "vtsls" }
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
            javascript      = { "prettier" },
            javascriptreact = { "prettier" },
            typescript      = { "prettier" },
            typescriptreact = { "prettier" },
            css             = { "prettier" },
            html            = { "prettier" },
            json            = { "prettier" },
            jsonc           = { "prettier" },
            yaml            = { "prettier" },
            markdown        = { "prettier" },
            graphql         = { "prettier" },
            vue             = { "prettier" },
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
