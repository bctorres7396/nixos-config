
  { config, pkgs, ...}:
  {
    home.username = "ben";
    home.homeDirectory = "/home/ben";
    home.stateVersion = "25.11";
  
    programs.home-manager.enable = true;

      catppuccin.enable = true;
      catppuccin.flavor = "mocha";
      wayland.windowManager.hyprland = {
        enable = true;
        settings = {
          monitor = ",1920x1080, auto, 1";
          exec-once = [ "waybar" ];
          bind = [
            "SUPER, Return, exec, kitty"
            "SUPER, Q, killactive"
            "SUPER, M, exit"
            "SUPER, Space, exec, wofi --show drun"
          ];
        };
      };

     programs.waybar = {
  enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "battery" "network" "pulseaudio" ];

      clock = {
        format = "{:%H:%M}";
        tooltip = false;
      };

      battery = {
        format = "BAT {capacity}%";
        tooltip = false;
      };

      network = {
        format-wifi = "WiFi {signalStrength}%";
        format-disconnected = "No Network";
        tooltip = false;
      };

      pulseaudio = {
        format = "VOL {volume}%";
        tooltip = false;
      };
    };
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
       nerd-fonts.jetbrains-mono
       nerd-fonts.fira-code
     ];
     
     fonts.fontconfig.enable = true;
  }
