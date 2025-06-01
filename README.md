# :construction: nixos-config
[![NixOS 25.05](https://img.shields.io/badge/NixOS-25.05-blue.svg?style=flat-square&logo=NixOS&logoColor=white)](https://nixos.org)


## Hosts

**aamorim-latitude**: work laptop

## Usage

System rebuild

```
sudo nixos-rebuild switch
```

Remove packages and old generations
```
sudo nix-collect-garbage -d
```

## First install

Enable git in your `/etc/nixos/configuration.nix`
```
environment.systemPackages = with pkgs; [
    git
];
```

Clone this repo on your home folder
```
git clone git@github.com:aAmorim27/nixos-config.git
```

Backup your default config
```
sudo mv /etc/nixos /etc/nixos_bak
```

Create a symlink to the `~/nixos-config` folder

```
sudo ln -s ~/nixos-config /etc/nixos
```

Copy `/etc/nixos_bak/hardware-configuration.nix` to `~/nixos-config/hardware-configuration.nix`
```
sudo cp /etc/nixos_bak/hardware-configuration.nix  ~/nixos-config/hardware-configuration.nix
```

Rebuild the system
```
sudo nixos-rebuild switch --flake .#{host_name}
```
