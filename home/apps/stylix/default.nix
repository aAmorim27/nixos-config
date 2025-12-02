{ pkgs, ... }:
{
  stylix = {
    enable = true;
    image = ../../../wallpapers/wall.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
    cursor = {
       name = "Adwaita";
       package = pkgs.adwaita-icon-theme;
       size = 16;
    };
    polarity = "dark";
    opacity = {
      terminal= 0.8;
    };
  };
}
