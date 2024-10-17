{
  lib,
  pkgs,
  ...
}:

{
  home.packages = lib.attrValues {
    inherit (pkgs)
      swaybg
      ;
  };
  wayland.windowManager.river = {
    enable = true;
    settings = {
      spawn = [
        "swaybg -m fill -i ${./shana.jpg}"
        "mako"
      ];
    };
    map = {
      normal =
        {
        };
    };
  };
}
