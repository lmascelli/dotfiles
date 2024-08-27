LM.languages.rust = {
  lsp_config = {
    name = "rust-analyzer",
    cmd = { "rust-analyzer" },
    root_dir = vim.fs.root(0, { "Cargo.toml" }),
    filetypes = { "rust" },
  }
}
