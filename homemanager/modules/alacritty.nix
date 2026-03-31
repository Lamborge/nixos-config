{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      /*cursor = {
        smooth_motion = true;
        smooth_motion_factor = 0.4;
        smooth_motion_spring = 0.8;
        block_replace_shape = "block";
      };*/

      window = {
        dynamic_title = true;
      };

      font = {
        normal = {
          family = "JetBrainsMono NFM";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono NFM";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono NFM";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono NFM";
          style = "Bold Italic";
        };
        size = 12.5;
      };

      terminal.shell = {
        program = "${pkgs.fish}/bin/fish";
      };
    };
  };
}
