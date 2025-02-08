{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;

  environment.systemPackages = with pkgs; [
    vim
    git
    kitty
    firefox
    discord
    vscode
    maim
    xclip
    glxinfo
    wofi
  ];


  fonts.packages = with pkgs; [
    iosevka
  ];
}
