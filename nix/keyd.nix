{
  config,
  pkgs,
  lib,
  ...
}: {
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        extraConfig = ''
          [main]
          leftmeta = layer(meta_mac)
          rightmeta = layer(meta_mac)

          leftalt = overload(opt, leftalt)
          rightalt = overload(opt, rightalt)

          leftcontrol = overload(control, leftcontrol)
          rightcontrol = overload(control, rightcontrol)

          [meta_mac:C]
          # App switcher
          tab = C-9
          # Spotlight-eque
          space = M-space
          enter = A-enter

          [opt]
          left = C-left
          right = C-right
          backspace = C-backspace


          [control]
          left = C-1
          right = C-2
        '';
      };
    };
  };
}
