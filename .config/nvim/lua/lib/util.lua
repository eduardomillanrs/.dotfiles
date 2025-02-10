---@class lib.util
local M = {}

---Constructs a path string by joining the provided arguments
---@param ... string The parts of the path to join
---@return string The constructed path string
function M.path(...)
    local is_win = vim.uv.os_uname().sysname == "Windows_NT"

    return table.concat({ ... }, is_win and "\\" or "/")
end

return M
