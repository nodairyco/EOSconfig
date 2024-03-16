return {
  "nvim-treesitter/nvim-treesitter", 
  buil = ":TSUpdate",
  config=function()
    -- Treesitter setup
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed= {"lua", "ocaml", "bash"},
      highlight={enable=true},
      indent={enable=true}
    })
  end
}
