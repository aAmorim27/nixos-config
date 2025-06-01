{pkgs, lib, ...}:
with lib.hm.gvariant;
{
  home.packages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.open-bar
    gnomeExtensions.blur-my-shell
    gnomeExtensions.system-monitor
  ];
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "dash-to-dock@micxgx.gmail.com"
        "openbar@neuromorph"
        "system-monitor@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
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
      set-overview = true;
      height = 45.0;
      margin = 0.0;
      neon = false;
      bwidth = 1.0;
      bcolor = ["0.933" "0.745" "0.745"];
      mbalpha = 1.0;
      mbcolor = ["0.933" "0.745" "0.745"];
      mshalpha = 0.0;
      iscolor = ["0.188" "0.204" "0.275"];
      hcolor= ["0.255" "0.271" "0.349"];
      fgcolor = ["0.776" "0.816" "0.961"];
      mfgcolor = ["0.161" "0.173" "0.235"];
      mbgcolor = ["0.161" "0.173" "0.235"];
      mbgalpha = 1.00;
      mhcolor = ["0.949" "0.835" "0.812"];
      mhalpha = 0.20;
      mscolor = ["0.933" "0.745" "0.745"];
      smbgoverride = true;
      smbgcolor = ["0.255" "0.271" "0.349"];
      autofg-bar = false;
      autohg-bar = false;
      autofg-menu = true;
      autohg-menu = false;
    };
    "org/gnome/shell/extensions/system-monitor" = {
      show-swap = false;
    };
  };
}
