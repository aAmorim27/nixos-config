{ config, pkgs, lib,nvf, ... }:

{
  imports = [
    nvf.homeManagerModules.default
    ./home/apps/cursor
    ./home/apps/direnv
    ./home/apps/fastfetch
    ./home/apps/gh
    ./home/apps/git
    ./home/apps/go
    ./home/apps/google-chrome
    ./home/apps/kitty
    ./home/apps/mkcert
    ./home/apps/neovim
    ./home/apps/rust
    ./home/apps/rust-rover
    ./home/apps/slack
    ./home/apps/volta
    ./home/apps/vscode
    ./home/apps/spotify
    ./home/apps/terraform
    ./home/apps/webstorm
    ./home/apps/zsh
    ./home/desktops/gnome
  ];

  home.username = "aamorim";
  home.homeDirectory = "/home/aamorim";
  
# This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
