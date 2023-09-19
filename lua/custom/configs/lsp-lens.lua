return {
  sections = {
    -- definition = function(count)
    --   return "Definitions: " .. count
    -- end,
    references = function(count)
      return count .. "references"
    end,
    implements = function(count)
      return count .. "implements"
    end,
  },
}
