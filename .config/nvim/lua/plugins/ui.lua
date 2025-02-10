return {
    {
        "catppuccin/nvim",
        enabled = false,
        lazy    = true,
        name    = "catppuccin",
        opts    = {
            flavour                = "auto",
            background             = {
                light = "latte",
                dark  = "mocha",
            },
            transparent_background = false,
            show_end_of_buffer     = true,
            term_colors            = false,
            dim_inactive           = {
                enabled    = false,
                shade      = "dark",
                percentage = 0.15,
            },
            no_italic              = false,
            no_bold                = false,
            no_underline           = false,
            styles                 = {
                comments     = { "italic" },
                conditionals = { "italic" },
                loops        = { "italic" },
                functions    = { "italic" },
                keywords     = {},
                strings      = {},
                variables    = {},
                numbers      = { "bold" },
                booleans     = { "bold" },
                properties   = {},
                types        = {},
                operators    = {},
            },
            color_overrides        = {
                mocha = {
                    rosewater = "#efc9c2",
                    flamingo  = "#ebb2b2",
                    pink      = "#f2a7de",
                    mauve     = "#b889f4",
                    red       = "#ea7183",
                    maroon    = "#ea838c",
                    peach     = "#f39967",
                    yellow    = "#eaca89",
                    green     = "#96d382",
                    teal      = "#78cec1",
                    sky       = "#91d7e3",
                    sapphire  = "#68bae0",
                    blue      = "#739df2",
                    lavender  = "#a0a8f6",
                    text      = "#b5c1f1",
                    subtext1  = "#a6b0d8",
                    subtext0  = "#959ec2",
                    overlay2  = "#848cad",
                    overlay1  = "#717997",
                    overlay0  = "#63677f",
                    surface2  = "#505469",
                    surface1  = "#3e4255",
                    surface0  = "#2c2f40",
                    base      = "#1a1c2a",
                    mantle    = "#141620",
                    crust     = "#0e0f16",
                },
            },
            custom_highlights      = function (colors)
                return {
                    Pmenu     = { fg = colors.text, bg = colors.mantle },
                    PmenuSbar = { bg = colors.mantle },
                }
            end,
            default_integrations   = true,
            integrations           = {
                blink_cmp = true,
                snacks    = true,
            },
        },
        init    = function ()
            vim.cmd.colorscheme("catppuccin")
        end
    },
    {
        "rebelot/kanagawa.nvim",
        enabled = true,
        lazy    = true,
        opts    = {
            compile        = false,
            undercurl      = true,
            commentStyle   = { italic = true },
            functionStyle  = { italic = true },
            keywordStyle   = { italic = true },
            statementStyle = { bold = true },
            typeStyle      = {},
            transparent    = false,
            dimInactive    = false,
            terminalColors = true,
            colors         = {
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides      = function (_)
                return {}
            end,
            theme          = "wave",
            background     = {
                dark  = "dragon",
                light = "lotus"
            },
        },
        init    = function ()
            vim.cmd.colorscheme("kanagawa")
        end
    },
    {
        "linrongbin16/lsp-progress.nvim",
        opts = {
            spinner          = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
            spin_update_time = 125,
            decay            = 2000,
            event            = "LspProgressUpdated",
            series_format    = function (title, message, percentage)
                local messages = {}

                if title and #title > 0 then
                    table.insert(messages, title)
                end

                if message and #message > 0 then
                    table.insert(messages, message)
                end

                if percentage and #messages > 0 then
                    table.insert(messages, ("(%.0f%%)"):format(percentage))
                end

                return table.concat(messages, " ")
            end,
            client_format    = function (client_name, spinner, series_messages)
                if #series_messages == 0 then
                    return nil
                end

                return ("[%s] %s %s"):format(client_name, spinner, series_messages[1])
            end,
            format           = function (client_messages)
                return table.concat(client_messages, " ")
            end,
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = function ()
            local lsp_progress = require("lib.lualine.components.lsp-progress")

            return {
                options           = {
                    theme                = "auto",
                    icons_enabled        = true,
                    component_separators = { left = "|", right = "|" },
                    section_separators   = { left = "", right = "" },
                    disabled_filetypes   = {
                        statusline = {},
                        winbar     = {},
                    },
                    ignore_focus         = {},
                    always_divide_middle = true,
                    globalstatus         = true,
                    refresh              = {
                        statusline = 100,
                        tabline    = 100,
                        winbar     = 100,
                    }
                },
                sections          = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = { "filename" },
                    lualine_x = { lsp_progress, "diagnostics" },
                    lualine_y = {
                        { "filetype",   icons_enabled = false },
                        "encoding",
                        { "fileformat", icons_enabled = false }
                    },
                    lualine_z = { "location" }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline           = {
                    lualine_a = {
                        -- { "tabs", mode = 1, show_modified_status = false },
                        {
                            "tabs",
                            max_length = vim.o.columns / 3,
                            mode = 1,
                            path = 0,
                            use_mode_colors = false,
                            show_modified_status = false,
                        },
                        -- {
                        --     "buffers",
                        --     show_filename_only      = true,
                        --     hide_filename_extension = false,
                        --     show_modified_status    = false,
                        --     use_mode_colors         = false,
                        --     icons_enabled           = false,
                        --     mode                    = 0,
                        --     max_length              = vim.o.columns * 2 / 3,
                        --     filetype_names          = {
                        --         TelescopePrompt = "Telescope",
                        --         dashboard       = "Dashboard",
                        --         packer          = "Packer",
                        --         fzf             = "FZF",
                        --         alpha           = "Alpha"
                        --     },
                        --     symbols                 = {
                        --         alternate_file = "",
                        --     },
                        -- },
                    },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {}
                },
                winbar            = {},
                inactive_winbar   = {},
                extensions        = {}
            }
        end
    },
}
