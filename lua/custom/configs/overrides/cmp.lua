local status, cmp = pcall(require, "cmp")
if not status then return end

return {
  mapping = {
    ["<CR>"] = cmp.mapping(function(fallback) fallback() end),
    ["<C-y>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback) fallback() end),
  },
}
