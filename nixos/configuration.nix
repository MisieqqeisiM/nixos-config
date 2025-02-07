{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  hardware.pulseaudio.enable = true;

  services.xserver.xkb = {
    layout = "pl,ru";
    options = "caps:swapescape,grp:win_space_toggle";
  };

  services.xserver.enable = true;
  services.xserver.autorun = false;
  services.xserver.displayManager.startx.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    forceFullCompositionPipeline = true;
  };
  boot.initrd.kernelModules = [ "nvidia" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  hardware.opengl.enable = true;

  services.xserver.windowManager = {
    bspwm.enable = true;
    bspwm.configFile = "/home/suspicious_goo/bspwm/bspwmrc";
    bspwm.sxhkd.configFile = "/home/suspicious_goo/sxhkd/sxhkdrc";
  };

  console.useXkbConfig = true;

  programs.fish.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.suspicious_goo = {
    isNormalUser = true;
    description = "Michal Pajda";
    extraGroups = [ "audio" "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;

  environment.systemPackages = with pkgs; [
    vim
    git
    kitty
    sxhkd
    firefox
    dmenu
    discord
    picom
    jetbrains.idea-ultimate
    vscode
    maim
    xclip
    cgal
    gcc
    inkscape
    nasm
    gdb
    lean4
    elan
    python3
    deno
    nodejs
  ];


  fonts.packages = with pkgs; [
    iosevka
  ];

  system.stateVersion = "24.05";
}
