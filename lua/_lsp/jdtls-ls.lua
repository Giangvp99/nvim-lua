require'lspconfig'.jdtls.setup{
  cmd = {"jdtls"};
  filetypes = {"java"};
  on_attach=require'completion'.on_attach
}
