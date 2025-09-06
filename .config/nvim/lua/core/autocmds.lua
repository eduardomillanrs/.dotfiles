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

-- QuickFix local options
autocmd("FileType", {
    desc    = "Set local options to QuickFix",
    group   = augroup,
    pattern = "qf",
    command = "setlocal wrap",
})

-- LSP Attach
vim.api.nvim_create_autocmd("LspAttach", {
    desc     = "Setup LSP on attach",
    group    = augroup,
    callback = require("utils.lsp.on-attach")
})

-- Auto view
autocmd({ "BufWinLeave", "BufWritePost", "WinLeave" }, {
    desc     = "Save view with mkview for real files",
    group    = augroup,
    callback = function (args)
        if vim.b[args.buf].view_activated then
            vim.cmd.mkview({ mods = { emsg_silent = true } })
        end
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
                vim.cmd.loadview({ mods = { emsg_silent = true } })
            end
        end
    end,
})
