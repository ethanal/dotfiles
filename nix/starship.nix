{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$username[@](green)$hostname$directory$character";

      username = {
        show_always = true;
        format = "[$user]($style)";
        style_user = "green";
        style_root = "red";
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname]($style) ";
        style = "green";
      };

      directory={
        format="[$path]($style) ";
        style = "blue";
        truncation_length=0;
        truncate_to_repo=false;
        home_symbol="~";
      };
      character={
        format="\\$ ";
      };
      time={
        disabled=true;
      };

    };
  };
}
