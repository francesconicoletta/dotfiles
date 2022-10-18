vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = "",
      symlink_arrow = "->",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "-",
          arrow_open = ">",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "x",
          staged = "s",
          unmerged = "u",
          renamed = "r",
          untracked = "n",
          deleted = "d",
          ignored = "i",
        },
      },
    },
  },
  filters = {
    dotfiles = true,
  },
})
