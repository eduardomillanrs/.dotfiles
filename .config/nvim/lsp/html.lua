return {
    cmd          = { "vscode-html-language-server", "--stdio" },
    filetypes    = { "html" },
    root_markers = { "package.json", ".git" },
    settings     = {},
    init_options = {
        provideFormatter     = false,
        embeddedLanguages    = { css = true, javascript = true },
        configurationSection = { "html", "css", "javascript" },
    },
}
