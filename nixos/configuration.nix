# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
  ];
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
    sdl3
    ncurses6
    icu
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];
  boot.extraModprobeConfig = ''
    options btusb reset=1
  '';
  boot.kernelPackages = pkgs.linuxPackages_latest;
  security.polkit.enable = true;
  services.blueman.enable = true;
  hardware.enableAllFirmware = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.package = pkgs.bluez;
  hardware.bluetooth.powerOnBoot = true;
  hardware.firmware = [pkgs.linux-firmware];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # Load nvidia driver for Xorg
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    #Beta nvidia driver, use stable for latest stable
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };
  programs.steam.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";
  services.timesyncd.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = false;
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "mac_nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };
  # use the example session manager (no others are packaged yet so this is enabled by default,
  # no need to redefine it in your config for now)
  #media-session.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "maddie";
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    (discord-ptb.override {
      withVencord = true;
    })
    rust-analyzer
    zed-editor
    alejandra
    spotify-qt
    steam
    r2modman
    libreoffice
    git
    github-cli
    mesa
    rustup
    tealdeer
    rustlings
    transmission_4-qt
    gamescope
    prismlauncher
    zig
    gcc9
    clang
    steam-run
    kitty
    home-manager
    swaynotificationcenter
    wlogout
    blueman
    bluez
    bluez-tools
    waybar
    pavucontrol
    polkit_gnome
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    hyprpaper
    wofi
    hyprsunset
    hyprshot
    fastfetch
    hyfetch
    nushell
    everest-mons
    masterpdfeditor
    tetrio-desktop
    dotnetCorePackages.sdk_9_0_1xx-bin
    helix
    btop
    kdePackages.dolphin
    bridge-utils
    nftables
    dnsmasq
    ethtool
    unzip
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
  ];
  services.openssh.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.PubkeyAuthentication = true;
  users.users.maddie = {
    isNormalUser = true;
    home = "/home/maddie";
    createHome = true;
    extraGroups = ["networkmanager" "wheel"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEJ73TbbVMOj6ZSwRZC7jJYHn8RHV5WnFyVjw46lw88e"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM5fch61tl8WzpUs3Uwp8CkCgVaFZxfKxaDRue3tUZ3H"
    ];
  };
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
