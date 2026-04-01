{ pkgs, config, lib, ... }:
{

  imports = [
    ./modules/fish.nix
    ./modules/alacritty.nix
    ./modules/git.nix
    ./modules/gnome.nix
    ./modules/google-chrome.nix
  ];

  home =
  let
    username = "lamborge";
  in {
    inherit username;
    homeDirectory = "/home/${username}";

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
      size = 24;
    };

    stateVersion = "26.05";
  };
}
