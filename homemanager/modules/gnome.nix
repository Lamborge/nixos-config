{ pkgs, lib, config, ... }:
{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      clock-format = "24h";
      color-scheme = "prefer-dark";
      accent-color = "slate";
      cursor-theme = "Bibata-Original-Classic";
      cursor-size = 24;
      icon-theme = "Papirus-Dark";
      gtk-theme = "Adwaita";
    };
    "org/gnome/desktop/calendar" = {
      show-weekdate = false;
      week-starts-on-monday = true;
    };
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = -0.63;
    };
    "org/gnome/shell" = {
      hot-corner-enabled = false;
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
      dynamic-workspaces = true;
      workspaces-only-on-primary = false;
      attach-modal-dialogs = true;
      center-new-windows = true;
      resize-with-right-button = true;
    };
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = false;
    };
    "org/gnome/desktop/session" = {
      idle-delay = lib.hm.gvariant.mkUint32 0;
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "nothing";
    };
    "org/gnome/desktop/input-sources" = {
      sources = [
        (lib.hm.gvariant.mkTuple [ "xkb" "us" ])
        (lib.hm.gvariant.mkTuple [ "xkb" "ru" ])
      ];
      per-window = false;
      show-all-sources = true;
      xkb-options = [
        "compose:ralt"
        "lv3:rsuper_switch"
        "grp:caps_toggle"  # переключение языка на CapsLock
        "compose:ralt"
	"lv3:rsuper_switch" 
      ];
    };
    "org/gnome/desktop/wm/preferences" = {
      action-double-click-titlebar = "toggle-maximize";
      action-middle-click-titlebar = "none";
      action-right-click-titlebar = "menu";
      button-layout = "appmenu:minimize,maximize,close";
      focus-mode = "click";
      raise-on-click = false;
    };
    "org/gnome/desktop/wm/keybindings" = {
      window-action-key = [ "Alt_L" ];
    };
  };
}
