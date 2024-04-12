local M = {}
function M.get_icon(icon, textIcon, padding)
  if vim.g.icons_enabled then
    return icon and icon .. string.rep(" ", padding or 0) or ""
  else
    return textIcon and textIcon .. string.rep(" ", padding or 0) or ""
  end
end
return M
