vim.api.nvim_create_autocmd("User", {
    group    = vim.api.nvim_create_augroup("nvim-lsp-progress", { clear = true }),
    pattern  = "LspProgressUpdated",
    callback = require("lualine").refresh,
})

return function ()
    return require("lsp-progress").progress()
end
