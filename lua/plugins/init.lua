return {
  {
    import = "plugins.not_vscode",
    cond = function()
      return not vim.g.vscode
    end,
  },
}
