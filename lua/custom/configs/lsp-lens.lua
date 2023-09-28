return {
  sections = {
    definition = false,
    references = function(count)
      return count .. " references"
    end,
    implements = function(count)
      return count .. " implements"
    end,
  },
}
