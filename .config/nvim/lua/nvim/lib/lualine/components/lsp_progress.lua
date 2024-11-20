vim.api.nvim_create_augroup("LspProgress", { clear = true })
vim.api.nvim_create_autocmd("User", {
    group = "LspProgress",
    pattern = "LspProgressUpdated",
    callback = require("lualine").refresh,
})

return function ()
    return require("lsp-progress").progress()
end
