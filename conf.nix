{config, pkgs, ...}:
{
 imports = [
  <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-base.nix>
  <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
 ];
 networking.wireless.enable = true;
 hardware.pulseaudio.enable = true;
 services.upower.enable = true;
 isoImage.contents = [
  {
   source=./web-control;
   target="/web-control";
  }
  {
   source=./serviceThing;
   target="/serviceThing";
  }
  {
   source=./mountstuff;
   target="/mountstuff";
  }
  {
   source=./xbindkeysrc;
   target="/xbindkeysrc";
  }
 ];

 systemd.services.uwe = {
  description = "uwe service";
  serviceConfig = {
   Type = "forking";
   ExecStart = "/iso/serviceThing";
  };
  wantedBy = [ "default.target" ];
 };
 systemd.services.uwe.enable = true;

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
 environment.systemPackages = [
  pkgs.ed
  pkgs.st
  pkgs.surf
  pkgs.slock
  pkgs.dmenu
  pkgs.qemu
  pkgs.pamixer
  pkgs.python3
  pkgs.xbindkeys
 ];
}
