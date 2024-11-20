return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    },
    config = function ()
        local mason     = require("mason")
        local mason_lsp = require("mason-lspconfig")
        local lsp       = require("lspconfig")

        -- Mason setup
        mason.setup()

        -- Mason LSP setup
        mason_lsp.setup({
            automatic_installation = true,
        })

        -- LspAttach
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLsp", {}),
            callback = function (args)
                local bufnr = args.buf

                -- Completion
                vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

                -- Keymaps
                local keymap = vim.keymap.set
                local opts   = { buffer = bufnr }

                keymap("n", "gd", vim.lsp.buf.definition, opts)
                keymap("n", "gi", vim.lsp.buf.implementation, opts)
                keymap("n", "gy", vim.lsp.buf.type_definition, opts)
                keymap("n", "gx", vim.lsp.buf.references, opts)
                keymap("n", "gr", vim.lsp.buf.rename, opts)
                keymap("n", "<M-CR>", vim.lsp.buf.code_action, opts)

                keymap("n", "gh", function () require("nvim.lib.lsp.buf").hover() end, opts)
                keymap("n", "gs", function () require("nvim.lib.lsp.buf").signature_help() end, opts)
                keymap("n", "g=", function () require("nvim.lib.lsp.buf").format() end, opts)

                keymap("n", "g?", vim.diagnostic.setloclist)

                -- Diagnostics
                vim.diagnostic.config({
                    virtual_text     = true,
                    underline        = false,
                    signs            = false,
                    update_in_insert = false,
                    severity_sort    = true,
                })
            end,
        })

        -- LSP setup
        local servers = require("nvim.lib.lsp.servers")

        for server, opts in pairs(servers) do
            lsp[server].setup(opts)
        end
    end,
}
