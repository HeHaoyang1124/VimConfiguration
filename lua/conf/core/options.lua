-- 相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- tab等于4space
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true

-- 补全增强
vim.o.wildmenu = true

-- 显示tabline
vim.o.showtabline = 1

-- 分割窗口在右边
vim.opt.splitright = true

-- 剪切板
-- vim.opt.clipboard:append("unnamedplus")

--真彩色
vim.o.termguicolors = true

