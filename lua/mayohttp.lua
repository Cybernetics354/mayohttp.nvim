local M = {}

--- @class Window
--- @field width_scale number
--- @field height_scale number
--- @field style string
--- @field border string

--- @class Config
--- @field cmd string
--- @field args string[]
--- @field window Window
M.config = {
  cmd = "mayohttp",
  args = {},
  window = {
    width_scale = 1,
    height_scale = 1,
    style = "minimal",
    border = "none",
  }
}

--- Setup mayohttp.nvim
--- @param opts Config
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

--- Open mayohttp floating window based on the config given
function M.run()
  if vim.g.mayohttp_opened == 1 then
    print("Mayohttp already opened")
  end

  local buf = vim.api.nvim_create_buf(false, true)
  local win_width = vim.api.nvim_get_option("columns")
  local win_height = vim.api.nvim_get_option("lines")

  local width = math.floor(win_width * M.config.window.width_scale)
  local height = math.floor(win_height * M.config.window.height_scale)
  local col = math.floor((win_width - width) / 2)
  local row = math.floor((win_height - height) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = M.config.window.style,
    border = M.config.window.border,
  })

  local cmd = M.config.cmd
  for _, arg in ipairs(M.config.args) do
    cmd = cmd .. " " .. arg
  end

  vim.g.mayohttp_opened = 1
  vim.fn.jobstart(cmd, {
    term = true,
    on_exit = function(_, code, _)
      vim.g.mayohttp_opened = 0
      if code ~= 0 then
        return
      end

      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
        if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) then
          vim.api.nvim_buf_delete(buf, { force = true })
        end
      end
    end
  })
  vim.cmd("startinsert")
end

return M

