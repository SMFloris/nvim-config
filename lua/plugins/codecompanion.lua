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
          adapter = "ollama",
          model = "qwen2.5-coder:32b",
        },
        chat = {
          adapter = "ollama",
          model = "qwen2.5-coder:32b",
        },
        inline = {
          adapter = "ollama",
          model = "qwen2.5-coder:32b",
        },
      },
    })
  end,
}
