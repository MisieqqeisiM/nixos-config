{lib, ...}: {
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      background_blur = 5;
      background_opacity = 0.5;
      
      # Font
      font_family = "Iosevka";
      font_size = 12.0;
    };
  };
}
