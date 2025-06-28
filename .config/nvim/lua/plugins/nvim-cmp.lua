return {

    "hrsh7th/nvim-cmp",
    enabled      = false,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim",
    },
    opts         = function ()
        local cmp     = require("cmp")
        local lspkind = require("lspkind")

        return {
            snippet    = {
                expand = function (args)
                    vim.snippet.expand(args.body)
                end,
            },
            completion = {
                autocomplete = false,
            },
            window     = {
                completion = {
                    border = vim.o.winborder,
                },
                documentation = {
                    border = vim.o.winborder,
                },
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                })
            },
            sources    = {
                { name = "nvim_lsp" },
                { name = "path" },
            },
            mapping    = cmp.mapping.preset.insert({
                ["<C-n>"]  = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-p>"]  = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-u>"]  = cmp.mapping.scroll_docs(-4),
                ["<C-d>"]  = cmp.mapping.scroll_docs(4),
                ["<M-CR>"] = cmp.mapping.complete(),
                ["<C-c>"]  = cmp.mapping.abort(),
                ["<CR>"]   = cmp.mapping.confirm({ select = false }),
            }),
        }
    end,
}
