require('settings')
require('remaps')

function load_config()
  require('plugins.fugitive')
  require('plugins.maximizer')
  require('plugins.telescope')
  require('plugins.lspconfig')
  require('plugins.lspinstall')
  require('plugins.compe')
  require('plugins.treesitter')
  require('plugins.undotree')
  require('plugins.lualine')
  require('plugins.nvim-tree')
  require('colorscheme')
end

require('pack')
