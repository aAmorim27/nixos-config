{pkgs, ...}:
{
  home.file.".zsh/plugins/you-should-use" = {
    source = pkgs.fetchFromGitHub {
      owner = "MichaelAquilina";
      repo = "zsh-you-should-use";
      rev = "1.9.0";
      sha256 = "sha256-+3iAmWXSsc4OhFZqAMTwOL7AAHBp5ZtGGtvqCnEOYc0=";
    };
  };
  
  home.file.".zsh/themes/powerlevel10k" = {
    source = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "nvm" "docker-compose" "docker" "you-should-use"];
      custom= "$HOME/.zsh";
      theme= "powerlevel10k/powerlevel10k";
    };
    initExtra = ''
      export VOLTA_HOME="$HOME/.volta"
      export PATH="$VOLTA_HOME/bin:$PATH"
      source ~/.p10k.zsh
    '';
  };
}