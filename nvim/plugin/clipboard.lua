vim.opt.clipboard = { 'unnamedplus' }

local os_name = vim.loop.os_uname().sysname
if os_name == "Darwin" then
  vim.g.clipboard = {
    name = "mac",
    copy = {["+"] = "pbcopy", ["*"] = "pbcopy"},
    paste = {["+"] = "pbpaste", ["*"] = "pbpaste"},
  }
end
