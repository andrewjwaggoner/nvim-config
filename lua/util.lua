local module = {}

module.distinct = function(table1)
  local result = {}
  table1 = table1 or {}

  for _,v in ipairs(table1) do
    if not result[v] then
      table.insert(result, v)
    end
  end
  return result
end

module.merge = function(table1,table2)
  local result = {}
  table1 = table1 or {}
  table2 = table2 or {}

  for _, v in ipairs(table1) do
    table.insert(result, v)
  end

  for _, v in ipairs(table2) do
    table.insert(result, v)
  end

  return Util.distinct(result)
end

module.printTable = function(table, use_index)
  table = table or {}
  use_index = use_index or false
  for i, v in ipairs(table) do
    if use_index then
      print(i, v)
    else
      print(v)
    end
  end
end

return module
