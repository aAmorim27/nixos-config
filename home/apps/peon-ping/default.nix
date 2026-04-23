{ pkgs, peon-ping, ... }:
{
  programs.peon-ping = {
    package = peon-ping.packages.${pkgs.system}.default;
    enable = true;
    
    settings = {
      default_pack = "peasant_fr";
      volume = 0.5;
      enabled = true;
      desktop_notifications = true;
      categories = {
        "session.start" = true;
        "task.acknowledge" = true;
        "task.complete" = true;
        "task.error" = true;
        "input.required" = true;
        "resource.limit" = true;
        "user.spam" = true;
      };
    };

    # Install sound packs
    installPacks = [
      "peon_fr"
      "peasant_fr"
    ];
    
    enableZshIntegration = true;
  }; 

   home.file.".claude/settings.json".text = builtins.toJSON {
    alwaysThinkingEnabled = true;
    hooks = {
      SessionStart = [{
        hooks = [{
          type = "command";
          command = "${peon-ping.packages.${pkgs.system}.default}/bin/peon";
        }];
      }];
      Stop = [{
        hooks = [{
          type = "command";
          command = "${peon-ping.packages.${pkgs.system}.default}/bin/peon";
        }];
      }];
      Notification = [{
        hooks = [{
          type = "command";
          command = "${peon-ping.packages.${pkgs.system}.default}/bin/peon";
        }];
      }];
      PermissionRequest = [{
        hooks = [{
          type = "command";
          command = "${peon-ping.packages.${pkgs.system}.default}/bin/peon";
        }];
      }];
      PostToolUseFailure = [{
        hooks = [{
          type = "command";
          command = "${peon-ping.packages.${pkgs.system}.default}/bin/peon";
        }];
      }];
      PreCompact = [{
        hooks = [{
          type = "command";
          command = "${peon-ping.packages.${pkgs.system}.default}/bin/peon";
        }];
      }];
    };
  };
}
