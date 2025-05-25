{pkgs, lib, ...}:
with lib.hm.gvariant;
{
  home.packages = with pkgs; [
    gnomeExtensions.dock-from-dash
    gnomeExtensions.open-bar
  ];
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "dock-from-dash@fthx"
        "openbar@neuromorph"
        "system-monitor@gnome-shell-extensions.gcampax.github.com"
      ];
    };
    "org/gnome/desktop/interface" = {
      show-battery-percentage = true;
      enable-hot-corners = false;
    };
    "org/gnome/desktop/sound" = {
      event-sounds= false;
    };
    "org/gnome/shell/extensions/openbar" = {
      bartype = "Islands";
      height = 45.0;
      margin = 0.0;
      neon = false;
      bwidth = 0.0;
      mbalpha = 0.0;
      mshalpha = 0.0;
      iscolor = ["0.188" "0.204" "0.275"];
      hcolor= ["0.255" "0.271" "0.349"];
      fgcolor = ["0.776" "0.816" "0.961"];
      mfgcolor = ["0.776" "0.816" "0.961"];
      mbgcolor = ["0.161" "0.173" "0.235"];
      mbgalpha = 0.85;
      mhalpha = 0.20;
      mscolor = ["0.906" "0.510" "0.518"];
      autofg-bar = false;
      autohg-bar = false;
      autofg-menu = false;
      autohg-menu = false;
    };
    "org/gnome/shell/extensions/system-monitor" = {
      show-swap = false;
    };
  };
}
