{ inputs, pkgs, ... }: {
    imports = [
        inputs.ags.homeManagerModules.default
    ];

    home.packages = with pkgs; [
        inputs.matugen.packages.${system}.default

        fd
        brightnessctl
        swww
        slurp
        flameshot
        swappy
        hyprpicker
        pavucontrol
        networkmanagerapplet
        gtk3
        gtk4
    ];

    # programs.ags = {
    #   enable = true;
    #   configDir = null; # if ags dir is managed by home-manager, it'll end up being read-only. not too cool.
    #   configDir = ./.config/ags;

    #   extraPackages = with pkgs; [
    #       ydotool
    #   ];
    # };
}
