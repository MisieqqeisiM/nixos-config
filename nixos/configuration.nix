{ config, pkgs, lib, ... } : {
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
      ./locale.nix
      ./nvidia.nix
    ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;


  programs.fish.enable = true;

  programs.hyprland = {
    enable = true;
  };
  programs.hyprland.xwayland.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.suspicious_goo = {
    isNormalUser = true;
    description = "Michal Pajda";
    extraGroups = [ "audio" "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };


  system.stateVersion = "24.05";
}
