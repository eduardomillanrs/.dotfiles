return {
    "nvim-neo-tree/neo-tree.nvim",
    enabled      = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
    },
    config       = function ()
        local neotree = require("neo-tree")
        local command = require("neo-tree.command")

        -- Setup
        neotree.setup({
            close_if_last_window            = false,
            popup_border_style              = "rounded",
            enable_git_status               = false,
            enable_diagnostics              = false,
            enable_modified_markers         = false,
            open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
            sort_case_insensitive           = false,
            sort_function                   = nil,
            use_default_mappings            = false,
            default_component_configs       = {
                container      = {
                    enable_character_fade = true
                },
                indent         = {
                    indent_size        = 2,
                    padding            = 1,
                    with_markers       = true,
                    indent_marker      = "│",
                    last_indent_marker = "└",
                    highlight          = "NeoTreeIndentMarker",
                    with_expanders     = nil,
                    expander_collapsed = "",
                    expander_expanded  = "",
                    expander_highlight = "NeoTreeExpander",
                },
                icon           = {
                    folder_closed = "",
                    folder_open   = "",
                    folder_empty  = "󰜌",
                    default       = "*",
                    highlight     = "NeoTreeFileIcon"
                },
                modified       = {
                    symbol    = "[+]",
                    highlight = "NeoTreeModified",
                },
                name           = {
                    trailing_slash        = false,
                    use_git_status_colors = false,
                    highlight             = "NeoTreeFileName",
                },
                git_status     = {},
                file_size      = {
                    enabled        = true,
                    required_width = 64,
                },
                type           = {
                    enabled        = true,
                    required_width = 122,
                },
                last_modified  = {
                    enabled        = true,
                    required_width = 88,
                },
                created        = {
                    enabled        = true,
                    required_width = 110,
                },
                symlink_target = {
                    enabled = false,
                },
            },
            commands                        = {},
            window                          = {
                position = "left",
                width = 40,
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
                mappings = {
                    ["<space>"]       = { "toggle_node", nowait = false },
                    ["<2-LeftMouse>"] = "open",
                    ["<cr>"]          = "open",
                    ["<esc>"]         = "cancel",
                    ["s"]             = "open_split",
                    ["v"]             = "open_vsplit",
                    ["t"]             = "open_tabnew",
                    ["_"]             = "close_node",
                    ["-"]             = "close_all_nodes",
                    ["%"]             = { "add", config = { show_path = "relative" } },
                    ["d"]             = "delete",
                    ["r"]             = { "rename", config = { show_path = "relative" } },
                    ["x"]             = { "move", config = { show_path = "relative" } },
                    ["y"]             = { "copy", config = { show_path = "relative" } },
                    -- ["c"]             = "copy_to_clipboard",
                    -- ["C"]            = "cut_to_clipboard",
                    -- ["p"]             = "paste_from_clipboard",
                    ["q"]             = "close_window",
                    ["R"]             = "refresh",
                    ["?"]             = "show_help",
                    ["i"]             = "show_file_details",
                }
            },
            nesting_rules                   = {},
            filesystem                      = {
                filtered_items         = {
                    visible                = false,
                    hide_dotfiles          = false,
                    hide_gitignored        = false,
                    hide_hidden            = true,
                    hide_by_name           = {
                        ".git",
                    },
                    hide_by_pattern        = {},
                    always_show            = {},
                    always_show_by_pattern = {},
                    never_show             = {},
                    never_show_by_pattern  = {},
                },
                follow_current_file    = {
                    enabled         = true,
                    leave_dirs_open = false,
                },
                group_empty_dirs       = false,
                hijack_netrw_behavior  = "open_default",
                use_libuv_file_watcher = true,
                window                 = {
                    mappings = {
                        ["<bs>"] = "navigate_up",
                    },
                },
                commands               = {},
            },
            event_handlers                  = {
                {
                    event   = "file_open_requested",
                    handler = function ()
                        command.execute({ action = "close" })
                    end
                },
            }
        })

        -- Commands
        vim.api.nvim_create_user_command("Ex", "Neotree toggle", {})
    end,
}
