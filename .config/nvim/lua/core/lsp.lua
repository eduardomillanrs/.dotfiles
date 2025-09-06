local utils        = require("utils")
local capabilities = require("utils.lsp.capabilities")

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.enable(utils.get_servers())

vim.diagnostic.config({
    virtual_text     = false,
    underline        = false,
    signs            = false,
    update_in_insert = true,
    severity_sort    = true,
})
