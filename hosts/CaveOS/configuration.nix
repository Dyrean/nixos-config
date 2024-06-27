{ pkgs, username, hostname, ... }: {

    documentation.nixos.enable = false;
    nixpkgs.config.allowUnfree = true;
    
    nix.settings = {
		substituters = [
            "https://hyprland.cachix.org"
            "https://nix-gaming.cachix.org"
            # Nixpkgs-Wayland
            "https://cache.nixos.org"
            "https://nixpkgs-wayland.cachix.org"
            "https://nix-community.cachix.org"
            # Nix-community
            "https://nix-community.cachix.org"
        ];
		experimental-features = [ "nix-command" "flakes" ];
	};

    nix.package = pkgs.nixFlakes;

    security = {
        rtkit.enable = true;
        polkit.enable = true;
    };

    programs = {
        zsh.enable = true;
        dconf.enable = true;

        nix-ld.enable = true;

        direnv.enable = true; 
    };

    # Enable CUPS to print documents.
	services.printing.enable = true;

    users = {
        defaultUserShell = pkgs.zsh;
        users.${username} = {
            isNormalUser = true;
            description = "${username}";
            shell = pkgs.zsh;
            extraGroups = [ "networkmanager" "wheel" "video" "input" "uinput" "docker" ];
            packages = with pkgs; [
                brave
            ];
        };
    };
    
    security.sudo.wheelNeedsPassword = false;

    environment = {
        localBinInPath = true;
        variables.EDITOR = "nvim";
        systemPackages = with pkgs; [
            curl
            zsh
            git
            gh
            vim
            neovim

            wget
            nixpkgs-fmt
            nixfmt-classic

            gcc14
            mold
            gnumake
            cmake
            unzip
            unrar
            wl-screenrec
            wl-clipboard
            wl-clip-persist
            cliphist
            xdg-utils
            wlrctl
            coreutils-full
            gnutar
        ];
    };

    # Enable Networking
    networking = {
        hostName = "${hostname}";
        networkmanager.enable = true;
        firewall.enable = true;
    };

    # Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable Bluetooth
	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = false;
	services.blueman.enable = true;

    # Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.systemd-boot.configurationLimit = 10;

    # Optimize storage and automatic scheduled GC running
	# If you want to run GC manually, use commands:
	# `nix-store --optimize` for finding and eliminating redundant copies of identical store paths
	# `nix-store --gc` for optimizing the nix store and removing unreferenced and obsolete store paths
	# `nix-collect-garbage -d` for deleting old generations of user profiles
	nix.settings.auto-optimise-store = true;
	nix.optimise.automatic = true;
	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 7d";
	};

    # Scheduled auto upgrade system (this is only for system upgrades, 
	# if you want to upgrade cargo\npm\pip global packages, docker containers or different part of the system 
	# or get really full system upgrade, use `topgrade` CLI utility manually instead.
	# I recommend running `topgrade` once a week or at least once a month)
	system.autoUpgrade = {
		enable = true;
		operation = "switch"; # If you don't want to apply updates immediately, only after rebooting, use `boot` option in this case
		flake = "/etc/nixos";
		flags = [ "--update-input" "nixpkgs" "--update-input" "rust-overlay" "--commit-lock-file" ];
		dates = "weekly";
		# channel = "https://nixos.org/channels/nixos-unstable";
	};

    # This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.11"; # Did you read the comment?
}
