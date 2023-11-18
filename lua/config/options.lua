local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.number = true

-- explicitly setting this here
-- since it's the most obnoxious thing to ever exist
-- and needs to be entirely removed from existence with extreme
-- prejudice and righteous fury (not to mention common sense)
-- I don't have words to explain how much I hate this
opt.relativenumber = false

opt.termguicolors = false
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"
opt.ruler = true

-- Render whitespace
opt.list = true
opt.listchars = {
  tab = "→ ",
  space = "·",
  trail = "·",
  extends = "»",
}
--vim.cmd 'colorscheme panda'

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"
