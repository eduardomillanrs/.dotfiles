return {
    "saghen/blink.cmp",
    enabled = false,
    version = "*",
    event   = "InsertEnter",
    opts    = {
        keymap     = {
            preset     = "none",

            ["<M-CR>"] = { "show", "show_documentation", "hide_documentation" },
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
                border = "rounded",
                draw   = {
                    treesitter = { "lsp" },
                },
            },
            documentation = {
                auto_show          = true,
                auto_show_delay_ms = 200,
                window             = {
                    border = "rounded"
                },
            },
            ghost_text    = {
                enabled = false,
            },
        },
        signature  = {
            enabled = true,
            window  = {
                border = "rounded",
            },
        },
        sources    = {
            default         = { "lsp", "path", "buffer" },
            cmdline         = {},
            transform_items = function (_, items)
                return vim.tbl_filter(function (item)
                    return item.kind ~= require("blink.cmp.types").CompletionItemKind.Snippet
                end, items)
            end
        },
    },
    -- opts_extend = {
    --     "sources.default"
    -- }
}
