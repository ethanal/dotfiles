vim.opt.clipboard = "unnamed"

local function copy(lines, _)
  require("osc52").copy(table.concat(lines, "\n"))
end

local function paste()
  local s = vim.fn.system("curl -s --unix-socket /tmp/com.ethanlowman.pbserver.sock http://-")
  local reg = vim.fn.getreg("")

  if s == reg or s == nil then
    return {vim.fn.split(reg, "\n"), vim.fn.getregtype("")}
  end

  local lines = vim.fn.split(s, "\n")
  if vim.fn.len(lines) == 1 then
    return {lines, "v"}
  end
  return {lines, "V"}
end

local os_name = vim.loop.os_uname().sysname
if os_name == "Darwin" then
  vim.g.clipboard = {
    name = "mac",
    copy = {["+"] = "pbcopy", ["*"] = "pbcopy"},
    paste = {["+"] = "pbpaste", ["*"] = "pbpaste"},
  }
else
  vim.g.clipboard = {
    name = "osc52",
    copy = {["+"] = copy, ["*"] = copy},
    paste = {["+"] = paste, ["*"] = paste},
  }
end

