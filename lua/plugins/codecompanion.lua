return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        cmd = {
          adapter = "ollama"
        },
        chat = {
          adapter = "ollama",
        },
        inline = {
          adapter = "ollama",
        },
      },
    })
  end,
}
