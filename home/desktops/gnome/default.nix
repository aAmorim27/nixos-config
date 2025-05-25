{pkgs, config, ...}:
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
    };
    "org/gnome/shell/extensions/system-monitor" = {
      show-swap = false;
    };
  };
}
