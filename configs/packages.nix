{ config, pkgs, ... }:
{

  nixpkgs.config.allowUnfree = true;

  # PROGRAMS
  security.sudo.enable = true;

  programs = {
    firefox.enable = true;

    #===STEAM===
    steam = {
      enable = true;
      extraPackages = with pkgs; [ adwaita-icon-theme ];
    };
    steam.remotePlay.openFirewall = true;
    steam.extraCompatPackages = with pkgs; [ proton-ge-bin ];
    gamemode.enable = true;
    gamescope.enable = true;
    #==========

    obs-studio.enable = true;
    obs-studio.enableVirtualCamera = true;
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
    git
    dust
    htop
    lm_sensors

  # APPLICATIONS
    ayugram-desktop
    vesktop
    google-chrome
    element-desktop
    teamspeak6-client
    prismlauncher
    pavucontrol
    gnome-tweaks
    alacritty
    resources
    gparted
    flameshot
    scanmem
    libreoffice-fresh
    obs-studio
    qbittorrent
    vlc

    kdePackages.ark
    kdePackages.kdenlive

    (heroic.override {
      extraPkgs = pkgs': with pkgs'; [
        gamescope
	gamemode
      ];
    })

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
