local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<Esc>"] = actions.close
      }
    }
  }
}

require('telescope').load_extension('fzf')
