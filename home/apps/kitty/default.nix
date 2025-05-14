{pkgs,lib, ...}:
{
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = {
    enable = true;
    font= {
      name= lib.mkDefault "MesloLGS NF";
      size= 12;
    };
    settings= {
      enable_audio_bell= false;
    };
  };
}