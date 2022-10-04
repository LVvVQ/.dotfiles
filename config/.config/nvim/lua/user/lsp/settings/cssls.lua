return {
  settings = {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetype = { "css", "scss", "less" },
    root_dir = 'root_pattern("package.json", ".git") or bufdir',
    single_file_support = true,
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  }
}
