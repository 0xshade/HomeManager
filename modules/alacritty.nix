{ config, pkgs, ... }:

{
  programs.alacritty = { 
    enable = true;
    package = config.lib.nixGL.wrap pkgs.alacritty;
    settings = {
      # Shell integration - automatically start Zellij
      terminal.shell = {
        program = "${pkgs.zellij}/bin/zellij";
        args = [];
      };
      
      # Font configuration
      font = {
        size = 14.0;  # Use float for consistency
        normal = {
          family = "Mononoki Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "Mononoki Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "Mononoki Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "Mononoki Nerd Font";
          style = "Bold Italic";
        };
      };

      # Essential keybindings - Only what Zellij can't handle
      keyboard = {
        bindings = [
          # Font scaling
          { key = "Plus"; mods = "Control"; action = "IncreaseFontSize"; }
          { key = "Minus"; mods = "Control"; action = "DecreaseFontSize"; }
          { key = "Key0"; mods = "Control"; action = "ResetFontSize"; }
          
          # Terminal window management
          { key = "Return"; mods = "Alt|Control"; action = "ToggleFullscreen"; }
          { key = "N"; mods = "Control|Shift"; action = "SpawnNewInstance"; }
        ];
      };

#      Window settings
      window = {
        padding = { x = 16; y = 16; };
        dynamic_title = true;
      };

      # Basic colors
      colors = {
        primary = {
          background = "#1c1c2b";
          foreground = "#cdd6f4";
       };
      };
    };
  };
}
