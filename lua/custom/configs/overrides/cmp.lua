local status, cmp = pcall(require, "cmp")
if not status then
  return
end

local cmp_ui = require("core.utils").load_config().ui.cmp
local cmp_style = cmp_ui.style

local field_arrangement = {
  atom = { "kind", "abbr", "menu" },
  atom_colored = { "kind", "abbr", "menu" },
}

local max_width = 50

return {
  formatting = {

    -- default fields order i.e completion word + item.kind + item.kind icons
    fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },

    format = function(entry, item)
      local icons = require "nvchad.icons.lspkind"
      local icon = (cmp_ui.icons and icons[item.kind]) or ""

      item.abbr = item.abbr:len() > max_width and item.abbr:sub(1, max_width - 1) .. "…" or item.abbr

      if cmp_style == "atom" or cmp_style == "atom_colored" then
        icon = " " .. icon .. " "
        item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
        item.kind = icon
      else
        icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
        item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")

        if entry.completion_item.detail ~= nil and entry.completion_item.detail ~= "" then
          item.menu_hl_group = "Comment"
          if #entry.completion_item.detail > 10 then
            item.menu = " " .. entry.completion_item.detail:sub(1, 10 - 1) .. "…"
          else
            item.menu = " " .. entry.completion_item.detail
          end
        end
      end

      return item
    end,
  },

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
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
  },
}
