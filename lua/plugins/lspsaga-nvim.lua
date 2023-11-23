-- IMPROVE NVIM EXPERIENCE

return {
  "glepnir/lspsaga.nvim",
  lazy = false,
  config = function()
    require("lspsaga").setup({
      -- keybinds for navigation in lspsaga window
      move_in_saga = { prev = "<C-k>", next = "<C-j>" },

      finder = {
        left_width = 0.5,
        right_width = 0.5,
        layout = "normal",
        keys = {
          toggle_or_open = "<CR>",
          default = "ref",
          -- the defaults for those are trash
          -- s for vpslit and i for split, U WOT M8
          vsplit = "v",
          split = "s",
        },
      },

      diagnostic = {
        code_action_prompt = {
          enable = false,
        },
        show_code_action = false,
      },
      lightbulb = {
        enable = false,
      },

      -- get this icon trash outta here
      -- https://github.com/nvimdev/lspsaga.nvim/blob/4d85d4ad3ef6ba9ad0fffe478f834c29b5bfa57c/lua/lspsaga/lspkind.lua#L31
      ui = {
        devicon = false,
        kind = {
          Folder = { " " },
        },
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}
