return {
    "sainnhe/gruvbox-material",
    lazy     = false,
    priority = 1000,
    config   = function ()
        local opts = {
            background                = "hard",
            foreground                = "original",
            cursor                    = "aqua",
            enable_bold               = 1,
            enable_italic             = 1,
            diagnostic_text_highlight = 1,
            diagnostic_line_highlight = 1,
            diagnostic_virtual_text   = 1,
        }

        for k, v in pairs(opts) do
            vim.g["gruvbox_material_" .. k] = v
        end

        vim.cmd.colorscheme("gruvbox-material")
    end,
}
