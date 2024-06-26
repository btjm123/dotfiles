-- Prerequisites for nvim-tree (todo: migrate to vimrc)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>
vim.keymap.set("n", "<c-S>", ":w<CR>", { silent = true })
vim.keymap.set("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<leader>rg", "<cmd>lua require('fzf-lua').grep()<CR>", { silent = true })
vim.keymap.set("n", "<leader>gs", "<cmd>lua requi:qre('fzf-lua').git_status()<CR>", { silent = true })

-- Set up lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
