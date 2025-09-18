return {
    "saghen/blink.cmp",
    version = "1.*",
    opts    = {
        keymap     = {
            preset     = "none",

            ["<A-CR>"] = { "show", "show_documentation", "hide_documentation" },
            ["<CR>"]   = { "accept", "fallback" },

            ["<Up>"]   = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<C-p>"]  = { "select_prev", "fallback" },
            ["<C-n>"]  = { "select_next", "fallback" },

            ["<C-U>"]  = { "scroll_documentation_up", "fallback" },
            ["<C-d>"]  = { "scroll_documentation_down", "fallback" },
        },
        completion = {
            accept        = {
                auto_brackets = {
                    enabled = false,
                },
            },
            list          = {
                selection = { preselect = false, auto_insert = false },
            },
            menu          = {
                auto_show = false,
                draw      = {
                    treesitter = { "lsp" },
                },
            },
            documentation = {
                auto_show          = true,
                auto_show_delay_ms = 200,
            },
            ghost_text    = {
                enabled = false,
            },
        },
        fuzzy      = {
            implementation = "prefer_rust_with_warning",
        },
        sources    = {
            default         = { "lsp", "path", "buffer" },
            transform_items = function (_, items)
                return vim.tbl_filter(function (item)
                    return item.kind ~= require("blink.cmp.types").CompletionItemKind.Snippet
                end, items)
            end
        },
        signature  = {
            enabled = true,
            trigger = {
                enabled = false,
            },
        },
        cmdline    = {
            enabled = false,
            keymap  = {
                preset      = "none",
                ["<Tab>"]   = { "show_and_insert", "select_next" },
                ["<S-Tab>"] = { "show_and_insert", "select_prev" },
                ["<C-n>"]   = { "select_next", "fallback" },
                ["<C-p>"]   = { "select_prev", "fallback" },
                ["<Right>"] = { "select_next", "fallback" },
                ["<Left>"]  = { "select_prev", "fallback" },
                ["<CR>"]    = { "select_and_accept", "fallback" },

            },
        },
        term       = {},
    },
}
