{ config, pkgs, lib, ... }:

let
  neolambda = pkgs.fetchFromGitHub {
    owner = "ipatch";
    repo = "theme-neolambda";
    rev = "main";
    sha256 = "sha256-Lb6dBa5liY9hJza+YvDU25s6B7Zse84lYaZb6TG3cq8=";
  };
in
{
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "neolambda";
        src = neolambda;
      }
    ];

    interactiveShellInit = ''
      set -g theme_display_git yes
      set -g theme_display_user yes
    '';
  };

  xdg.configFile."fish/functions/fish_prompt.fish".source = "${neolambda}/fish_prompt.fish";
  xdg.configFile."fish/functions/fish_right_prompt.fish".source = "${neolambda}/fish_right_prompt.fish";
}
