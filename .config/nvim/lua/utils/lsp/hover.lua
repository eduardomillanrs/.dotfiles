local M = {}

function M.hover()
    local bufnr = vim.api.nvim_get_current_buf()
    local win = vim.api.nvim_get_current_win()
    local cursor = vim.api.nvim_win_get_cursor(win)
    local line = cursor[1] - 1
    local col = cursor[2]

    local diagnostics = vim.diagnostic.get(bufnr, { lnum = line })
    local cursor_diagnostics = {}

    -- Filter diagnostics exactly under cursor position
    for _, d in ipairs(diagnostics) do
        if col >= d.col and col <= d.end_col then
            table.insert(cursor_diagnostics, d.message)
        end
    end

    -- Prepare diagnostic section
    local diagnostic_lines = {}
    local highlights = {}

    if #cursor_diagnostics > 0 then
        local title = " Diagnostics:"
        table.insert(diagnostic_lines, title)
        table.insert(highlights, { hl = "DiagnosticError", line = 0, col_start = 0, col_end = #title })

        for _, msg in ipairs(cursor_diagnostics) do
            local start_line = #diagnostic_lines
            for l in msg:gmatch("[^\n]+") do
                table.insert(diagnostic_lines, "  " .. l)
                table.insert(highlights, { hl = "DiagnosticWarn", line = #diagnostic_lines - 1, col_start = 0, col_end = #l + 2 })
            end
            if start_line < #diagnostic_lines then
                table.insert(diagnostic_lines, "")
            end
        end
    end

    -- Request hover info from LSP
    vim.lsp.buf_request(bufnr, "textDocument/hover", {
        textDocument = vim.lsp.util.make_text_document_params(bufnr),
        position = { line = line, character = col }
    }, function (err, result, ctx, _)
        if err then
            vim.notify("Hover request failed", vim.log.levels.ERROR)
            return
        end

        local hover_lines = {}
        if result and result.contents then
            hover_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
            hover_lines = vim.lsp.util.trim_empty_lines(hover_lines)
        end

        -- Merge sections
        local final_lines = {}
        local section_offset = 0

        if #diagnostic_lines > 0 then
            vim.list_extend(final_lines, diagnostic_lines)
            section_offset = #diagnostic_lines
            if #hover_lines > 0 then
                table.insert(final_lines, "---")
                table.insert(final_lines, "") -- blank line before hover
            end
        end

        if #hover_lines > 0 then
            vim.list_extend(final_lines, hover_lines)
        end

        -- Open floating preview
        if not vim.tbl_isempty(final_lines) then
            local float_buf, float_win = vim.lsp.util.open_floating_preview(final_lines, "markdown", { focus = false })

            -- Apply highlights
            for _, hl in ipairs(highlights) do
                vim.api.nvim_buf_add_highlight(float_buf, -1, hl.hl, hl.line, hl.col_start, hl.col_end)
            end
        end
    end)
end

return M
