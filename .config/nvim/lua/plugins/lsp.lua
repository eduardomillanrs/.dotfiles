return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "williamboman/mason.nvim",
                config = true,
            },
            {
                "williamboman/mason-lspconfig.nvim",
                opts = {
                    automatic_installation = true,
                },
            },
        },
        config       = function ()
            local lspconfig = require("lspconfig")
            local lsp       = require("lib.lsp")

            for server, config in pairs(lsp.servers) do
                config = vim.tbl_deep_extend("force", config, {
                    capabilities = lsp.capabilities,
                })

                lspconfig[server].setup(config)
            end
        end,
        init         = function ()
            local lsp = require("lib.lsp")

            vim.api.nvim_create_autocmd("LspAttach", {
                group    = vim.api.nvim_create_augroup("nvim-lsp", { clear = true }),
                callback = function (args)
                    local bufnr = args.buf

                    -- Completion
                    vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

                    -- Keymaps
                    local map = vim.keymap.set

                    map("n", "gd", vim.lsp.buf.definition, { desc = "LSP definitions", buffer = bufnr })
                    map("n", "gi", vim.lsp.buf.implementation, { desc = "LSP implementations", buffer = bufnr })
                    map("n", "gy", vim.lsp.buf.type_definition, { desc = "LSP type definitions", buffer = bufnr })
                    map("n", "gx", vim.lsp.buf.references, { desc = "LSP references", buffer = bufnr })
                    map("n", "gr", vim.lsp.buf.rename, { desc = "LSP rename", buffer = bufnr })
                    map("n", "gh", vim.lsp.buf.hover, { desc = "LSP hover", buffer = bufnr })
                    map("n", "gs", vim.lsp.buf.signature_help, { desc = "LSP signature help", buffer = bufnr })
                    map("n", "<M-CR>", vim.lsp.buf.code_action, { desc = "LSP code action", buffer = bufnr })

                    map("n", "gD", vim.diagnostic.setqflist, { desc = "LSP Diagnostics", buffer = bufnr })

                    -- Diagnostics
                    vim.diagnostic.config({
                        virtual_text     = true,
                        underline        = false,
                        signs            = false,
                        update_in_insert = true,
                        severity_sort    = true,
                    })

                    -- Handlers
                    for id, handler in pairs(lsp.handlers) do
                        vim.lsp.handlers[id] = vim.lsp.with(vim.lsp.handlers[handler.name], handler.opts)
                    end
                end
            })
        end
    },
}
