{pkgs, ...}:
{
  home.packages = with pkgs; [
    vscode
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      golang.go
      ms-python.python
      ms-python.vscode-pylance
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-containers
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      eamodio.gitlens
      rust-lang.rust-analyzer
      ms-vsliveshare.vsliveshare
      bradlc.vscode-tailwindcss
      hashicorp.terraform
      jnoortheen.nix-ide
      charliermarsh.ruff
    ];
  };
}
