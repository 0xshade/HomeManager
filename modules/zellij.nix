{ config, pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "one-half-dark";
      pane_frames = true;
      default_layout = "compact";
      simplified_ui = true;
      copy_on_select = true;
      show_startup_tips = false;

      # Overriding any needed keybinds.
      # Raw KDL configuration
      keybinds = {
        normal = {
          "bind \"Ctrl Space\"" = {
            SwitchToMode = "tmux";
          };
        };
      };

      ui = {
        pane_frames = {
          rounded_corners = true;  # Softer appearance
        };
      };

    };
  };
}