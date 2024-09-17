require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

vim.o.guifont = "Source Code Pro:h10" -- text below applies for VimScript

vim.g.neovide_transparency = 0
vim.g.transparency = 0.1
vim.g.neovide_background_color = ("#0f1117" .. string.format("%x", math.floor(((255 * vim.g.transparency) or 0.1))))
