local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup("nvim-core", { clear = true })

-- Force autoindent on all file types
autocmd("FileType", {
    desc    = "Set autoindent to every file type",
    group   = augroup,
    pattern = "*",
    command = "setlocal autoindent",
})

-- Highlight on yank
autocmd("TextYankPost", {
    desc     = "Highlight when yanking (copying) text",
    group    = augroup,
    callback = function ()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 300 })
    end,
})

-- LSP Attach
vim.api.nvim_create_autocmd("LspAttach", {
    desc     = "Setup LSP on attach",
    group    = augroup,
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
    end
})
