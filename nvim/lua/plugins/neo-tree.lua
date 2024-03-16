return{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  -- Neotree setup
  config = function()
    vim.keymap.set('n','<C-n>', ':Neotree filesystem reveal left<CR>', {})
  end
}
