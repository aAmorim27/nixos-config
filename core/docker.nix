{pkgs, ...}:
{
  virtualisation.docker.enable = true;
  users.users.aamorim.extraGroups = [ "docker" ];
  environment.systemPackages = with pkgs; [ docker-compose ];
}