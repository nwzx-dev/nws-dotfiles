return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",

  opts = {
    user_default_options = {
      RGB = true,
      RRGGBB = true,
      names = false,
      RRGGBBAA = true,
      AARRGGBB = false,
      css = true,
      css_fn = true,
      tailwind = false,
      mode = "background",
    },
  },
}
