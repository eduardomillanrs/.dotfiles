local util = require("lib.util")

return {
    -- angularls    = {},
    bashls       = {
        filetypes = { "sh", "zsh" },
        settings  = {
            bashIde = {
                globPattern = "*@(.sh|.inc|.bash|.zsh|.command)",
            },
        },
    },
    cssls        = {},
    eslint       = {},
    html         = {},
    intelephense = {
        init_options = {
            storagePath       = util.path(vim.fn.stdpath("cache"), "intelephense"),
            globalStoragePath = util.path(vim.fn.stdpath("cache"), "intelephense"),
        },
        settings     = {
            intelephense = {
                format = {
                    braces = "k&r",
                },
            },
        },
    },
    lua_ls       = {
        on_init  = function (client)
            local path = client.workspace_folders[1].name

            if vim.uv.fs_stat(util.path(path, ".luarc.json")) or vim.uv.fs_stat(util.path(path, ".luarc.jsonc")) then
                return
            end

            client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                runtime = {
                    version = "LuaJIT"
                },
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME
                    }
                }
            })
        end,
        settings = {
            Lua = {},
        },
    },
    jsonls       = {},
    tailwindcss  = {},
    vtsls        = {},
    vimls        = {},
}
