local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local configs = require('lspconfig.configs')
if not configs.c3_lsp then
  configs.c3_lsp = {
    default_config = {
      cmd = { "c3lsp" },
      filetypes = { "c3", "c3i" },
      root_dir = function(pattern)
        local cwd = vim.uv.cwd()
        local root = util.root_pattern('.git')(pattern)

        -- prefer cwd if root is a descendant
        return util.path.is_descendant(cwd, root) and cwd or root
      end,
      settings = {},
      name = "c3_lsp"
    }
  }
end
lspconfig.c3_lsp.setup{}
