{config, pkgs, ...}:
{
 imports = [
  <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-base.nix>
  <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
 ];
 networking.wireless.enable = true;
 hardware.pulseaudio.enable = true;
 services.upower.enable = true;
 services.xserver = {
  enable = true;
  libinput.enable = true;
  desktopManager.xterm.enable = false;
  displayManager.startx.enable = true;
 };
 environment.systemPackages = [
  pkgs.ed
  pkgs.st
  pkgs.surf
  pkgs.slock
  pkgs.dmenu
  pkgs.qemu
  pkgs.pamixer
  pkgs.python3
  pkgs.dwm
 ];
}
