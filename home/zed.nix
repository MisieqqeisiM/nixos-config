{pkgs, lib, ...}:
{
  programs.zed-editor = {
    enable = true;
    extensions = ["nix" "toml" "elixir"  "make" "deno"];
    userSettings = {
      vim_mode = true;
      theme = {
        mode = "dark";
        light = "One Light";
        dark = "One Dark";
      };
      lsp = {
        nix.binary.path_lookup = true;
      };
    };
  };
}
