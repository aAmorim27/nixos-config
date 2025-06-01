{pkgs, config, ...}:
{
  home.file.".oh-my-zsh/plugins/you-should-use" = {
    source = pkgs.fetchFromGitHub {
      owner = "MichaelAquilina";
      repo = "zsh-you-should-use";
      rev = "1.9.0";
      sha256 = "sha256-+3iAmWXSsc4OhFZqAMTwOL7AAHBp5ZtGGtvqCnEOYc0=";
    };
  };
  
  home.file.".oh-my-zsh/themes/powerlevel10k" = {
    source = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
  };
  
  home.file.".p10k.zsh" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/aamorim/nixos-config/home/dotfiles/.p10k.zsh";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "nvm" "docker-compose" "docker" "you-should-use"];
      custom= "$HOME/.oh-my-zsh";
      theme= "powerlevel10k/powerlevel10k";
    };
    initContent = ''
      export VOLTA_HOME="$HOME/.volta"
      export PATH="$VOLTA_HOME/bin:$PATH"
      source ~/.p10k.zsh
    '';
  };
}