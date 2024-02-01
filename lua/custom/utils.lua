local M = {}

M.contains = function(list, x)
  for _, v in pairs(list) do
    if v == x then
      return true
    end
  end
  return false
end

M.has_file = function(dir_path, file_names, depth)
  local uv = vim.loop

  if depth < 0 then
    return false
  end

  local scanner, err = uv.fs_scandir(dir_path)
  if err then
    print("Cannot open directory: ", err)
    return false
  end

  while true do
    local name, typ = uv.fs_scandir_next(scanner)
    if name == nil then
      break
    end

    if typ == "file" and M.contains(file_names, name) then
      return true
    elseif typ == "directory" then
      if name == "node_modules" then
        return false
      end

      local found = M.has_file(dir_path .. "/" .. name, file_names, depth - 1)
      if found then
        return true
      end
    end
  end

  return false
end

return M
