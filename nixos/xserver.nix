{...}: {
  services.xserver.xkb = {
    layout = "pl,ru";
    options = "caps:swapescape,grp:win_space_toggle";
  };

  services.xserver.enable = true;
  services.xserver.autorun = false;
  services.xserver.displayManager.startx.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];

  services.xserver.windowManager = {
    bspwm.enable = true;
    bspwm.configFile = "/home/suspicious_goo/bspwm/bspwmrc";
    bspwm.sxhkd.configFile = "/home/suspicious_goo/sxhkd/sxhkdrc";
  };

  console.useXkbConfig = true;
}