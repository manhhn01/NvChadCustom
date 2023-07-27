local status, cmp = pcall(require, "cmp")
if not status then
  return
end

return {
  mapping = cmp.mapping.preset.insert {
    ["<CR>"] = cmp.mapping(function(fallback)
      fallback()
    end),
    ["<C-y>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      fallback()
    end),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      fallback()
    end),
    ["<C-<esc>>"] = cmp.mapping.complete(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
  },
}

