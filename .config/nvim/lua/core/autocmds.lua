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
        -- map("n", "gD", vim.diagnostic.setqflist, { desc = "LSP Diagnostics", buffer = bufnr })


        -- map("n", "gh", require("utils.lsp.hover").hover, { desc = "LSP hover", buffer = bufnr })
    end
})

-- Auto view
autocmd({ "BufWinLeave", "BufWritePost", "WinLeave" }, {
    desc     = "Save view with mkview for real files",
    group    = augroup,
    callback = function (args)
        if vim.b[args.buf].view_activated then vim.cmd.mkview { mods = { emsg_silent = true } } end
    end,
})

autocmd("BufWinEnter", {
    desc     = "Try to load file view if available and enable view saving for real files",
    group    = augroup,
    callback = function (args)
        if not vim.b[args.buf].view_activated then
            local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
            local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
            local ignore_filetypes = { "gitcommit", "gitrebase", "svg", "hgcommit" }
            if buftype == "" and filetype and filetype ~= "" and not vim.tbl_contains(ignore_filetypes, filetype) then
                vim.b[args.buf].view_activated = true
                vim.cmd.loadview { mods = { emsg_silent = true } }
            end
        end
    end,
})
