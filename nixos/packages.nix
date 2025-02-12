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
    xwaylandvideobridge
    pipewire
    wireplumber
    nixd
    nil
    xdg-utils
    hyprshot
    (lutris.override {
      extraLibraries =  pkgs: [

      ];
    })
    steam
    deno
  ];


  fonts.packages = with pkgs; [
    iosevka
  ];
}
