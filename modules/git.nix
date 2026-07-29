{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "0xshade";
    userEmail = "0xshade";
  };

home.packages = with pkgs; [
    git-filter-repo
  ];

}
