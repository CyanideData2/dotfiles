# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: let
  unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
in {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    kitty
    tmux
    wget
    curl
    python3Full
  ];

  programs.fish.enable = true;
  programs.neovim = {
    enable = true;
    withPython3 = true;
    vimAlias = true;
    defaultEditor = true;
  };
  users.defaultUserShell = pkgs.fish;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.julia = {
    isNormalUser = true;
    description = "Julia";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  specialisation = {
    KDEplasma.configuration = {
      system.nixos.tags = ["KDE_Plasma"];
      environment.systemPackages = with pkgs; [
      ];
      services.xserver.enable = true;
      services.displayManager.sddm.enable = true;
      services.displayManager.sddm.wayland.enable = true;
      services.displayManager.sddm.settings.General.DisplayServer = "wayland";
      services.desktopManager.plasma6.enable = true;
      services.desktopManager.plasma6.enableQt5Integration = true;
      environment.plasma6.excludePackages = with pkgs.kdePackages; [
        konsole
        ark
        elisa
        kate
      ];
      # qt = {
      #   enable = true;
      #   platformTheme = "gnome";
      #   style = "adwaita-dark";
      # };
    };
    Hyprland.configuration = {
      system.nixos.tags = ["Hyprland"];

      programs.hyprland.enable = true;
      qt.enable = true;
      security.polkit.enable = true;
      environment.systemPackages = with pkgs; [
        #Must have
        SwayNotificationCenter
        pipewire
        wireplumber
        polkit_gnome
        qt

        #OS
        waybar
        swaybg
        anyrun
        kidex
        hyprpicker
        clipse
        dolphin
        networkmanagerapplet
        blueman
      ];
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;l

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
