-- FILE TREE

local config = function()
	require("nvim-tree").setup({
    renderer = {
      icons = {
        glyphs = {
          folder = {
            arrow_closed = ">",
            arrow_open = "▼",
          }
        },
        show = {
          file = false,
          folder = false,
          git = false
        }
      }
    },
  })
end

return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = config
}
