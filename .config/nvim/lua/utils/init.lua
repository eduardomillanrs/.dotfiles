local M = {}

function M.path(...)
    local is_win = vim.uv.os_uname().sysname == "Windows_NT"

    return table.concat({ ... }, is_win and "\\" or "/")
end

function M.get_servers()
    local servers = {}
    local path    = M.path(vim.fn.stdpath("config"), "lsp")
    local fs      = vim.uv.fs_scandir(path)

    if not fs then
        return servers
    end

    while true do
        local name = vim.uv.fs_scandir_next(fs)

        if not name then
            break
        end

        table.insert(servers, name:match("(.+)%..+$") or name)
    end

    return servers
end

function M.root_markers_with_field(root_files, new_names, field, fname)
    local path = vim.fn.fnamemodify(fname, ":h")
    local found = vim.fs.find(new_names, { path = path, upward = true })

    for _, f in ipairs(found or {}) do
        -- Match the given `field`.
        for line in io.lines(f) do
            if line:find(field) then
                root_files[#root_files + 1] = vim.fs.basename(f)
                break
            end
        end
    end

    return root_files
end

function M.insert_package_json(root_files, field, fname)
    return M.root_markers_with_field(root_files, { "package.json", "package.json5" }, field, fname)
end

return M
