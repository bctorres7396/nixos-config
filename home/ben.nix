
  { config, pkgs, ...}:
  {
    home.username = "ben";
    home.homeDirectory = "/home/ben";
    home.stateVersion = "25.11";
  
    programs.home-manager.enable = true;

    # Hyprland
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        monitor = "preferred,auto,1";
        
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
        };

        input = {
          kb_layout = "us";
          touchpad.natural_scroll = true; 
        };

        bind = [
          "SUPER, Return, exec, kitty"
          "SUPER, Q, killactive"
          "SUPER, M, exit"
          "SUPER, Space, exec, wofi --show drun"
          "SUPER, 1, workspace, 1"
          "SUPER, 2, workspace, 2"
          "SUPER, 3, workspace, 3"
        ];
      };
     };

     home.packages = with pkgs; [
       kitty
       wofi
       waybar
       hyprpaper
       grim
       slurp 
       wl-clipboard
       brightnessctl
       pamixer
       networkmanagerapplet
       firefox
     ];

     programs.kitty = {
       enable = true;
       settings = {
         font_size = "12.0";
         background_opacity = "0.95";
       };
     };

     programs.zsh = {
       enable = true;
     };
   }
