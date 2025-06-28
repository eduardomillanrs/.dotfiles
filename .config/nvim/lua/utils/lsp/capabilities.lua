local has_cmp, cmp         = pcall(require, "cmp_nvim_lsp")
local has_blink, blink     = pcall(require, "blink.cmp")

local default_capabilities = {
    workspace = {
        fileOperations = {
            didRename  = true,
            willRename = true,
        },
    },
}

if has_cmp then
    return cmp.default_capabilities()
elseif has_blink then
    return blink.get_lsp_capabilities(default_capabilities)
else
    return default_capabilities
end
