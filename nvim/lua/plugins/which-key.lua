return {
  "folke/which-key.nvim",
  opts = {
    function(_, opts)
      if require("lazyvim.util").has("noice.nvim") then
        opts.defaults["<leader>sn"] = { name = "+noice" }
      end
    end
  },
  init=function()
    -- code
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end
}
