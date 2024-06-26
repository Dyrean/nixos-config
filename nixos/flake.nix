{
	description = "Dyrean's NixOS Configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	};

	outputs = { nixpkgs, ... } @ inputs: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			modules = [
				./configuration.nix
				./hardware-configuration.nix
				./fonts.nix
				./internationalisation.nix
				./bluetooth.nix
				./bootloader.nix
				./auto-upgrade.nix
				./networking.nix
				./gnome.nix
				./printing.nix
				./sound.nix
				./users.nix
				./nixpkgs.nix
				./services.nix
				./firewall.nix
				./gc.nix
				./nix-settings.nix
				./terminal.nix
				./utils.nix
				./environment.nix
				./security.nix
				./virtualisation.nix
				./dns.nix
			];
		};
	};
}
