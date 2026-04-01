{ config, pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;

    enableVirtualCamera = true;

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-background-removal
      obs-pipewire-audio-capture
      obs-vaapi
      obs-gstreamer
      obs-vkcapture
      droidcam-obs
    ];
  };
}
