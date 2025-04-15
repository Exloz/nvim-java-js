return {
  "hrsh7th/nvim-cmp",
  opts = function()
    local cmp = require("cmp")
    local conf = require("nvchad.configs.cmp")

    local mymappings = {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<Tab>"] = cmp.mapping(function(fallback)
        local key = vim.api.nvim_replace_termcodes(_G.smart_tab(), true, true, true)
        vim.api.nvim_feedkeys(key, "n", true)
      end, { "i", "s" }),
      ["<S-Tab>"] = function() end,
    }
    conf.mapping = vim.tbl_deep_extend("force", conf.mapping, mymappings)
    return conf
  end,
}
