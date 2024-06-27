{
    description = "Dyrean's NixOS Configuration";

    outputs = { self, home-manager, ... }:
    let
        hostname = "CaveOS";
        username = "dyrean";
    in
    {
        # editing flake.nix triggers certain utilities such as direnv
        # to reload - editing host configurations do not require a direnv
        # reload, so lets move hosts out of the way
        nixosConfigurations = import ./hosts { inherit self; inherit hostname; inherit username; inherit home-manager; };
    };
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        thorium.url = "github:end-4/nix-thorium";

        hyprland.url = "github:hyprwm/Hyprland";
        hyprland-plugins = {
            url = "github:hyprwm/hyprland-plugins";
            # inputs.nixpkgs.follows = "hyprland";
        };

        flake-parts = {
            url = "github:hercules-ci/flake-parts";
            inputs.nixpkgs-lib.follows = "nixpkgs";
        };

        gross = {
            url = "github:fufexan/gross";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.flake-parts.follows = "flake-parts";
        };

        more-waita = {
            url = "github:somepaulo/MoreWaita";
            flake = false;
        };
    };
}
