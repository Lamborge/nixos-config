{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Lamborge";
	email = "lamborge@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}
