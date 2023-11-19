-- LANGUAGE SERVERS, FORMATERS, LINTERS

return {
  "williamboman/mason.nvim",
  lazy = false,
  config = function()
    local mason = require("mason")

    local options = {
      ensure_installed = { "stylua" },
      max_concurrent_installers = 10,
    }

    mason.setup(options)

    vim.api.nvim_create_user_command("MasonInstallAll", function()
      vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
    end, {})
  end,
}
