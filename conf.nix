{config, pkgs, ...}:
{
 imports = [
  <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-base.nix>
  <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
 ];
 services.xserver = {
  enable = true;
  libinput.enable = true;
  desktopManager.xterm.enable = false;
  displayManager.auto = {
   enable = true;
   user = "nixos";
  };
  windowManager = {
   dwm.enable = true;
   default = "dwm";
  };
 };
 networking.wireless = {
  enable = true;
  # networks. .psk = " ";
 };
 hardware.pulseaudio.enable = true;
 environment.systemPackages = [
  pkgs.ed
  pkgs.st
  pkgs.surf
  pkgs.slock
  pkgs.dmenu
  pkgs.qemu
  pkgs.pamixer
  pkgs.upower
  pkgs.python3
 ];
 services.upower.enable = true;
}
