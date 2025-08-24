{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    
    shellAliases = {
      cd = "z";
      ls = "eza --icons --group-directories-first";
      ll = "eza -la --icons --group-directories-first";
      la = "eza -a --icons --group-directories-first";
      tree = "eza --tree --icons";
      zi = "z -i";  # Interactive zoxide
    };

    bashrcExtra = ''
      # Simple, clean prompt with current directory path
      export PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '

      # Better history settings
      export HISTSIZE=10000
      export HISTFILESIZE=10000
      export HISTCONTROL=ignoredups:erasedups
      shopt -s histappend

      # Menu-style tab completion with TAB navigation
      bind 'set completion-ignore-case on'
      bind 'set show-all-if-ambiguous on'
      bind 'set menu-complete-display-prefix on'
      bind 'TAB:menu-complete'
      bind 'set colored-completion-prefix on'
      bind 'set colored-stats on'
      bind 'set visible-stats on'
      bind 'set mark-symlinked-directories on'
      bind 'set show-all-if-unmodified on'
      
      # Use Shift+Tab to go backwards in menu
      bind '"\e[Z":menu-complete-backward'

      # User specific environment
      if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
          PATH="$HOME/.local/bin:$HOME/bin:$PATH"
      fi      
      # Check if .npm-global exists, if so add it as part of the PATH.
      [ -d "$HOME/.npm-global/bin" ] && PATH="$HOME/.npm-global/bin:$PATH"
      # Check if .npm-global exists, if so add it as part of the PATH.
      [ -d "$HOME/.npm-global/bin" ] && PATH="$HOME/.npm-global/bin:$PATH"
      # Check if .nix-profile exists, if so add it as part of the PATH.
      [ -d "$HOME/.nix-profile/bin" ] && PATH="$HOME/.nix-profile/bin:$PATH"
      export PATH

      ## Sources
      # Does nvm exist? then source it 
      [ -f "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"


    '';
  };
  
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };
}