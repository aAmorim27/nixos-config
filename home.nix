{ config, pkgs, lib, ... }:

{
  imports = [
    ./home/apps/git
    ./home/apps/google-chrome
    ./home/apps/nodejs
    ./home/apps/pnpm
    ./home/apps/slack
    ./home/apps/stylix
    ./home/apps/vscode
    ./home/apps/spotify
    ./home/apps/webstorm
    ./home/apps/zsh
    ./home/desktops/gnome
  ];

  home.username = "aamorim";
  home.homeDirectory = "/home/aamorim";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
   ghostty
  ];
  
  #programs.bash = {
  #  enable = true;
  #  enableCompletion = true;
  #  # TODO add your custom bashrc here
  #  bashrcExtra = ''
  #    export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
  #  '';
  #};


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
