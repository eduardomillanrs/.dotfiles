local registry = require("mason-registry")

local M = {}

M.get_install_path = function (name)
    local exists, package = pcall(registry.get_package, name)

    if not exists then
        return ""
    end

    return package:get_install_path()
end


return M
