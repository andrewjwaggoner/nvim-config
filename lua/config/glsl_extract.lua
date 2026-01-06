local glsl_extract = {}

-- HEAVILY COERCED CHATGPT to do this after about an hour of prompting. Still no diagnostics being shown.

function glsl_extract.extract()
  local bufnr = vim.api.nvim_get_current_buf()

  -- Get visual selection positions
  local start_pos = vim.fn.getpos("'<")  -- {bufnum, line, col, off}
  local end_pos   = vim.fn.getpos("'>")  -- {bufnum, line, col, off}

  -- Convert to 0-based Lua indices
  local start_line = start_pos[2] - 1
  local start_col  = start_pos[3] - 1
  local end_line   = end_pos[2] - 1
  local end_col    = end_pos[3] - 1

  -- Ensure selection is normalized (start < end)
  if (start_line > end_line)
     or (start_line == end_line and start_col > end_col) then
    start_line, end_line = end_line, start_line
    start_col, end_col   = end_col, start_col
  end

  -- Grab all lines in the selected range
  local lines = vim.api.nvim_buf_get_lines(bufnr, start_line, end_line + 1, false)
  if #lines == 0 then
    vim.notify("No text selected!", vim.log.levels.ERROR)
    return
  end

  -- Compute prefix (text before selection on the first line)
  local prefix = lines[1]:sub(1, start_col)
  -- Compute suffix (text after selection on the last line)
  local suffix = lines[#lines]:sub(end_col + 1 + 1)  -- +1 for 1-based to 0-based, +1 again to skip the selected char

  -- Extract the exact substring into `chunk`
  local chunk = {}
  if #lines == 1 then
    -- Single-line selection
    local selected_text = lines[1]:sub(start_col + 1, end_col + 1)
    chunk[1] = selected_text
  else
    -- Multi-line selection
    -- first line: from start_col..end
    chunk[1] = lines[1]:sub(start_col + 1)
    -- middle lines: everything in between
    for i = 2, #lines - 1 do
      chunk[#chunk + 1] = lines[i]
    end
    -- last line: from beginning..end_col
    chunk[#chunk + 1] = lines[#lines]:sub(1, end_col + 1)
  end

  -- Create a new normal buffer for editing
  local glsl_buf = vim.api.nvim_create_buf(false, false)
  vim.api.nvim_buf_set_option_value("buflisted", true, { buf = glsl_buf })
  vim.api.nvim_buf_set_option_value("filetype", "glsl", { buf = glsl_buf })
  vim.api.nvim_buf_set_option_value("swapfile", false, { buf = glsl_buf })

  -- Give the buffer a filename so saving works
  local tmp_file = "/tmp/glsl_extract_" .. os.time() .. ".glsl"
  vim.api.nvim_buf_set_name(glsl_buf, tmp_file)

  -- Insert the chunk
  vim.api.nvim_buf_set_lines(glsl_buf, 0, -1, false, chunk)

  -- Save needed info for write-back
  glsl_extract.selection = {
    original_buf = bufnr,
    start_line   = start_line,
    end_line     = end_line,
    start_col    = start_col,
    end_col      = end_col,
    prefix       = prefix,
    suffix       = suffix,
  }

  -- Split + go to that buffer
  vim.cmd("vsplit | buffer " .. glsl_buf)

  -- Optional: attach GLSL LSP
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    if client.name == "glsl_analyzer" then
      vim.lsp.buf_attach_client(glsl_buf, client.id)
    end
  end

  -- Autocmd: On BufWritePost, re-inject once, then close the buffer
  vim.api.nvim_create_autocmd("BufWritePost", {
    buffer = glsl_buf,
    once   = true,  -- single-shot
    callback = function()
      glsl_extract.write_back(glsl_buf)
      -- Force close the GLSL buffer after writing back
      vim.api.nvim_buf_delete(glsl_buf, { force = true })
    end
  })
end

function glsl_extract.write_back(glsl_buf)
  local sel = glsl_extract.selection
  if not sel then
    vim.notify("No selection tracked.", vim.log.levels.ERROR)
    return
  end

  local new_lines = vim.api.nvim_buf_get_lines(glsl_buf, 0, -1, false)
  if #new_lines == 0 then
    new_lines = { "" }
  end

  -- Rebuild final lines to replace original selection
  local final = {}

  if #new_lines == 1 then
    -- Single-line reinjection
    final[1] = sel.prefix .. new_lines[1] .. sel.suffix
  else
    -- Multi-line reinjection
    final[1] = sel.prefix .. new_lines[1]     -- merge prefix w/ first line
    -- middle lines
    for i = 2, (#new_lines - 1) do
      final[#final + 1] = new_lines[i]
    end
    -- last line + suffix
    final[#new_lines] = new_lines[#new_lines] .. sel.suffix
  end

  -- Replace the original lines in the buffer
  vim.api.nvim_buf_set_lines(sel.original_buf, sel.start_line, sel.end_line + 1, false, final)

  vim.notify("GLSL updated in original buffer. Single-shot edit complete!", vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("ExtractGLSL", function()
  glsl_extract.extract()
end, { range = true })

return glsl_extract

