return {
    "hrsh7th/nvim-cmp",
    event        = "InsertEnter",
    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
    },
    opts         = function ()
        local cmp     = require("cmp")
        local types   = require("cmp.types")
        local lspkind = require("lspkind")

        return {
            snippet    = {
                expand = function (args)
                    vim.snippet.expand(args.body)
                end,
            },
            window     = {
                completion    = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                fields = { "abbr", "kind", "menu" },
                format = lspkind.cmp_format({
                    mode          = "symbol_text",
                    ellipsis_char = "...",
                    before        = function (_, vim_item)
                        vim_item.menu = ""
                        return vim_item
                    end,
                }),
            },
            mapping    = cmp.mapping.preset.insert({
                ["<C-u>"]  = cmp.mapping.scroll_docs(-4),
                ["<C-d>"]  = cmp.mapping.scroll_docs(4),
                ["<C-n>"]  = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }),
                ["<C-p>"]  = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }),
                ["<CR>"]   = cmp.mapping.confirm({ select = false }),
                ["<M-CR>"] = cmp.mapping.complete(),
            }),
            sources    = cmp.config.sources({
                { name = "nvim_lua" },
                { name = "nvim_lsp" },
                { name = "path" },
            }),
        }
    end,
}
