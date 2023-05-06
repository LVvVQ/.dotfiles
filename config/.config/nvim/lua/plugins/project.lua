return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Telescope project" },
    },
    config = function()
      require("project_nvim").setup {
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml", "gradlew", "mvnw" },
      }
    end,
  }
}
