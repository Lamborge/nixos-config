{ pkgs, ... }:
{

  imports = [
    ./modules/fish.nix
    ./modules/alacritty.nix
    ./modules/git.nix
  ];

  home =
  let
    username = "lamborge";
  in {
    inherit username;
    homeDirectory = "/home/${username}";


    stateVersion = "26.05";
  };
}
