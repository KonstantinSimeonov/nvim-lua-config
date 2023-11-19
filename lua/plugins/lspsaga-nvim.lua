-- IMPROVE NVIM EXPERIENCE

return {
    "glepnir/lspsaga.nvim",
    lazy = false,
    config = function()
        require("lspsaga").setup({
            -- keybinds for navigation in lspsaga window
            move_in_saga = { prev = "<C-k>", next = "<C-j>" },
            -- use enter to open file with definition preview
            definition_action_keys = {
                edit = "<CR>",
            },

            finder = {
                keys = {
                    toggle_or_open = "<CR>",
                    -- the defaults for those are trash
                    -- s for vpslit and i for split, U WOT M8
                    vsplit = "v",
                    split = "s",
                },
            },

            -- get this icon trash outta here
            -- https://github.com/nvimdev/lspsaga.nvim/blob/4d85d4ad3ef6ba9ad0fffe478f834c29b5bfa57c/lua/lspsaga/lspkind.lua#L31
            ui = {
                devicon = false,
                kind = {
                    Folder = { " " },
                    File = { "" },
                    Module = { "" },
                    Namespace = { "" },
                    Package = { "" },
                    Class = { "" },
                    Method = { "" },
                    Property = { "" },
                    Field = { "" },
                    Constructor = { "" },
                    Enum = { "" },
                    Interface = { "" },
                    Function = { "" },
                    Variable = { "" },
                    Constant = { "" },
                    String = { "" },
                    Number = { "" },
                    Boolean = { "" },
                    Array = { "" },
                    Object = { "" },
                    Key = { "" },
                    Null = { "" },
                    EnumMember = { "" },
                    Struct = { "" },
                    Event = { "" },
                    Operator = { "" },
                    TypeParameter = { "" },
                },
            },
        })
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
}
