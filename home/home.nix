{config, pkgs, ...} : {
  imports = [
    ./hyprland.nix
    ./kitty.nix
  ];
  home = {
    username = "suspicious_goo";
    homeDirectory = "/home/suspicious_goo";
    stateVersion = "25.05";
  };

}
