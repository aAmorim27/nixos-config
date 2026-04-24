{
  home.file.".cache/noctalia/wallpapers.json" = {
      text = builtins.toJSON {
        defaultWallpaper = "/home/aamorim/nixos-config/wallpapers/wall.png";
      };
  };
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        barType = "floating";
        position = "top";
        density = "comfortable";
        widgets = {
          left = [
            {
              id="Launcher";
              useDistroLogo=true;
            }
            {
              id="ActiveWindow";
              showText=false;
            }
            {
              id="Workspace";
            }
          ];
          center = [ 
            {
              id="Clock";
            }
            {
              id="MediaMini";
              maxWidth=320;
              showVisualizer=true;
            } 
          ];
          right = [
            {
              id="SystemMonitor";
            }
            {
              id="NotificationHistory";
            }
            {
              id="Bluetooth";
            }
            {
              id="Volume";
            }
            {
              id="Battery";
              displayMode="icon-always";
            }
            {
              id="ControlCenter";
              icon="power";
            }
          ];
        };
      };
      notifications = {
         density="compact";
      };
      general = {
        language="en";
      };
      location = {
        name = "Paris, France";
      };
      controlCenter= {
        cards = [
          {
            enabled=true;
            id="profile-card";
          }
          {
            enabled=true;
            id="shortcuts-card";
          }
          {
            enabled=true;
            id="brightness-card";
          }
          {
            enabled=true;
            id="audio-card";
          }
          {
            enabled=true;
            id="weather-card";
          }
          {
            enabled=true;
            id="media-sysmon-card";
          }
        ];
      };
      colorSchemes.predefinedScheme = "Catppuccin";
    };
  };
}