return {
  settings = {
    cmd = { "emmet-ls", "--stdio" },
    -- on_attach = on_attach,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    root_dir = 'git root',
    single_file_support = true,
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
  }
}
