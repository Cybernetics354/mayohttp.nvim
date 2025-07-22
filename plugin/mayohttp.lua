vim.api.nvim_create_user_command("MayoHttp", function()
  require("mayohttp").run()
end, {})

