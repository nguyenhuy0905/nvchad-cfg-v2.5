local neogen = require("neogen")
neogen.setup{
  languages = {
    cs = {
      template = {
        annotation_convention = "xmldoc",
      }
    },
    python = {
      template = {
        annotation_convention = "reST",
      }
    }
  }
}
