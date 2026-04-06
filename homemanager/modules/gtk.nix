{ ... }:
{
  gtk = {
    enable = true;
    theme.name = "Adwaita:dark";
  };

  systemd.user.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
  };
}
