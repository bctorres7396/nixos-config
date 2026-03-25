
  { config, pkgs, ...}:
  {
    home.username = "ben";
    home.homeDirectory = "/home/ben";
    home.stateVersion = "25.11";
  
    programs.home-manager.enable = true;
      wayland.windowManager.hyprland = {
        enable = true;
        settings = {
          monitor = ",1920x1080, auto, 1";
          bind = [
            "SUPER, Return, exec, kitty"
            "SUPER, Q, killactive"
            "SUPER, M, exit"
            "SUPER, Space, exec, wofi --show drun"
          ];
        };
      };

     home.packages = with pkgs; [
       kitty
       wofi
       waybar
       firefox
       git
       hyprland
       hyprpaper
       grim
       slurp
       wl-clipboard
       brightnessctl
       pamixer
       networkmanagerapplet
     ];
  }
