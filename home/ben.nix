
  { config, pkgs, ... }:
{
  home.username = "ben";
  home.homeDirectory = "/home/ben";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  catppuccin.enable = true;
  catppuccin.flavor = "mocha";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    kitty
    wofi
    waybar
    firefox
    git
    hyprpaper
    grim
    slurp
    wl-clipboard
    brightnessctl
    pamixer
    networkmanagerapplet
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    swww
    starship
    spotify
    fastfetch
    thunar
    xdg-utils
    swaylock
    wlogout
  ];

  fonts.fontconfig.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ",1920x1080,auto,1";
      exec-once = [
        "swww-daemon"
        "sleep 1 && swww img /home/ben/.config/hyprpaper/wallpaper.jpg --transition-type wipe --transition-duration 2"
        "waybar"
      ];
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        col.active_border = "rgb(89b4fa) rgb(cba6f7) 45deg";
        col.inactive_border = "rgb(313244)";
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
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        ",XF86AudioRaiseVolume, exec, pamixer -i 5"
        ",XF86AudioLowerVolume, exec, pamixer -d 5"
        ",XF86AudioMute, exec, pamixer -t"
        ",XF86MonBrightnessUp, exec, brightnessctl set 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        "SUPER, E, exec, thunar"
        "SUPER, P, exec, grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png"
        "SUPER, Z, exec, grim ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png"
        "SUPER, L, exec, swaylock"
        "SUPER, X, exec, wlogout"
      ];
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
  ];
};
    };
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "battery" ];
        clock = {
          format = " {:%H:%M}";
          tooltip = false;
        };
        battery = {
          format = " {capacity}%";
          tooltip = false;
        };
        network = {
          format-wifi = " {signalStrength}%";
          format-disconnected = "disconnected";
          tooltip = false;
        };
        pulseaudio = {
          format = " {volume}%";
          tooltip = false;
        };
        "hyprland/workspaces" = {
          format = "{id}";
          on-click = "activate";
          persistent-workspaces = {
            "*" = 5;
          };
        };
      };
    };
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
      }
      window#waybar {
        background-color: #1e1e2e;
        color: #cdd6f4;
        border-bottom: 2px solid #313244;
      }
      #workspaces button {
        padding: 0 8px;
        color: #6c7086;
      }
      #workspaces button.active {
        color: #89b4fa;
        border-bottom: 2px solid #89b4fa;
      }
      #clock {
        color: #a6e3a1;
        padding: 0 12px;
      }
      #battery {
        color: #f9e2af;
        padding: 0 12px;
      }
      #network {
        color: #89dceb;
        padding: 0 12px;
      }
      #pulseaudio {
        color: #f5c2e7;
        padding: 0 12px;
      }
    '';
  };

  programs.kitty = {
    enable = true;
    settings = {
      font_size = "12.0";
      background_opacity = "0.95";
      background = "#1e1e2e";
      foreground = "#cdd6f4";
      cursor = "#f5e0dc";
      selection_background = "#313244";
      color0 = "#45475a";
      color1 = "#f38ba8";
      color2 = "#a6e3a1";
      color3 = "#f9e2af";
      color4 = "#89b4fa";
      color5 = "#f5c2e7";
      color6 = "#94e2d5";
      color7 = "#bac2de";
      color8 = "#585b70";
      color9 = "#f38ba8";
      color10 = "#a6e3a1";
      color11 = "#f9e2af";
      color12 = "#89b4fa";
      color13 = "#f5c2e7";
      color14 = "#94e2d5";
      color15 = "#a6adc8";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      format = "$username$directory$git_branch$git_status$cmd_duration$line_break$character";
      username = {
        show_always = true;
        format = "[$user]($style) ";
        style_user = "bold purple";
      };
      directory = {
        format = "[$path]($style) ";
        style = "bold blue";
        truncation_length = 3;
      };
      git_branch = {
        format = "[$symbol$branch]($style) ";
        style = "bold pink";
      };
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
      cmd_duration = {
        min_time = 500;
        format = "[$duration]($style) ";
        style = "bold yellow";
      };
    };
  };

  programs.zsh = {
    enable = true;
  };

  programs.wofi = {
  enable = true;
  style = ''
    window {
      background-color: #1e1e2e;
      border: 2px solid #313244;
      border-radius: 10px;
    }
    #input {
      background-color: #313244;
      color: #cdd6f4;
      border: none;
      border-radius: 5px;
      padding: 8px;
      margin: 8px;
    }
    #inner-box {
      background-color: #1e1e2e;
    }
    #outer-box {
      padding: 8px;
    }
    #entry {
      padding: 8px;
      border-radius: 5px;
      color: #cdd6f4;
    }
    #entry:selected {
      background-color: #313244;
      color: #89b4fa;
    }
    #text {
      color: #cdd6f4;
    }
    #text:selected {
      color: #89b4fa;
    }
  '';
};  

}
