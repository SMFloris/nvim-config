local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local configs = require('lspconfig.configs')
if not configs.c3_lsp then
  configs.c3_lsp = {
    default_config = {
      cmd = { "c3lsp" },
      filetypes = { "c3", "c3i" },
      root_dir = function(fname)
          return util.find_git_ancestor(fname)
      end,
      settings = {},
      name = "c3_lsp"
    }
  }
end
lspconfig.c3_lsp.setup{}
