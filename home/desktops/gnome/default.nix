{pkgs, ...}:
{
  home.packages = with pkgs; [
    gnomeExtensions.dock-from-dash
    gnomeExtensions.system-monitor
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "dock-from-dash@fthx"
        "system-monitor"
      ];
    };
    "org/gnome/desktop/interface" = {
      show-battery-percentage = true;
      enable-hot-corners = false;
    };
    "org/gnome/desktop/sound" = {
      event-sounds= false;
    };
    "org/gnome/shell/extensions/system-monitor"= {
      enabled = true;
    };
  };
}