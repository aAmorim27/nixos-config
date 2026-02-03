# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, user, stateVersion, hostName, ... }:

{
  imports =
    [
      ./core/bluetooth.nix
      ./core/bootloader.nix
      ./core/docker.nix
      ./core/garbage-collector.nix
      ./core/printer.nix
      ./core/udev.nix
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = {
    inherit hostName;
    networkmanager.enable = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  # TODO: MOVE GNOME SPECIFICS TO GNOME CONFIG
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      xkb = {
        layout = "fr";
        variant = "azerty";
      };
    };
    thermald = {
      enable = true;
    };
    gnome = {
      games.enable = false;
    };
    displayManager = {
      gdm = {
        enable = true;
      }; 
    };
    desktopManager = {
      gnome = {
        enable = true;
      }
    };
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing.enable = true;
  };

  environment = {
    gnome.excludePackages = with pkgs; [ 
      gnome-tour
      cheese
      epiphany
      yelp
      geary
      seahorse
      gnome-clocks 
      gnome-contacts
      gnome-maps 
      gnome-music 
      gnome-weather
      gnome-connections
    ];
    systemPackages = with pkgs; [
      vim 
      wget
      git
      zsh
      gcc
    ];
    variables.EDITOR = "vim";
  }
  
  security.rtkit.enable = true;

  # Configure console keymap
  console.keyMap = "fr";
  time.timeZone = "Europe/Paris";
  i18n = {
    defaultLocale = "fr_FR.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
  };
  
  programs = {
    zsh.enable = true;
    firefox.enable = true;
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        zlib
        stdenv.cc.cc
        libgcc
      ];
    }
  }

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = stateVersion; # Did you read the comment?
  
  fonts.packages = with pkgs; [
    meslo-lgs-nf
  ];
}