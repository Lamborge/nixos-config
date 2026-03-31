{ config, pkgs, ... }:
{
  # PROGRAMS
  security.sudo.enable = true;

  programs = {
    firefox.enable = true;

    steam = {
      enable = true;
      extraPackages = with pkgs; [ adwaita-icon-theme ];
    };
    steam.remotePlay.openFirewall = true;
    steam.extraCompatPackages = with pkgs; [ proton-ge-bin ];
    gamemode.enable = true;
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
  # CLI UTILITIES
    vim
    fish
    btop
    fastfetch
    wget
    neovim
    python315
    oh-my-fish
    git

  # APPLICATIONS
    ayugram-desktop
    vesktop
    google-chrome
    element-desktop
    teamspeak6-client
    gnome-tweaks
    alacritty
    resources

  # THEMING
    papirus-icon-theme
    bibata-cursors
    bibata-cursors-translucent

  # GNOME EXTENSIONS
  ] ++ (with gnomeExtensions; [
    appindicator
    applications-menu
    dash-to-dock
    resource-monitor
    xwayland-indicator
  ]);
}
