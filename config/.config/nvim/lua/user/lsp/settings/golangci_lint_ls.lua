return {
  settings = {
    cmd = { "golangci-lint-langserver" },
    filetype = { "go", "gomod" },
    init_options = {
      command = { "golangci-lint", "run", "--out-format", "json" }
    },
    root_dir = "root_pattern('go.work') or root_pattern('go.mod', '.golangci.yaml', '.git')",
  }
}
