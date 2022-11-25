return {
  setting = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
      hostInfo = "neovim"
    },
    root_dir = 'root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")',
  }
}
