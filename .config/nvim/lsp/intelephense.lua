---@type vim.lsp.Config
return {
    cmd          = { "intelephense", "--stdio" },
    filetypes    = { "php" },
    root_markers = { ".git", "composer.json" },
    init_options = {
        globalStoragePath = vim.fn.stdpath("cache")
    }
}
