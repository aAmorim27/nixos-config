{
  programs.nvf = {
    enable = true;
    enableManpages = true;
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };
      vim.languages = 
      {
        ts.enable = true;
        html.enable = true;
        go.enable = true;
        markdown.enable = true;
        nix.enable = true;
        python.enable = true;
        rust.enable = true;
      };
    };
  };
}