return {
  settings = {
    cmd = { "gopls" },
    filetype = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = 'root_pattern("go.mod", ".git")',
    single_file_support = true,
  }
}
