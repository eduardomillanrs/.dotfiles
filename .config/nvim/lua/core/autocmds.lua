local autocmd = vim.api.nvim_create_autocmd

local group   = vim.api.nvim_create_augroup("nvim-core", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
    group    = group,
    callback = function ()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 300 })
    end,
})

-- Resize splits if window got resized
autocmd("VimResized", {
    group    = group,
    callback = function ()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. vim.fn.tabpagenr())
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group    = group,
    callback = function (event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end

        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- Force autoindent on all file types
autocmd("FileType", {
    group   = group,
    pattern = "*",
    command = "setlocal autoindent",
})
