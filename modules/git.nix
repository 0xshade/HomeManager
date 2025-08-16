{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "0xshade";
    userEmail = "0xshade";
  }
}