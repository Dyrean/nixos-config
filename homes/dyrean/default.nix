{ ... }:
let
    username = "dyrean";
    homeDirectory = "/home/dyrean";
in
{
    imports = [
        ./ags.nix
        ./anyrun.nix
        ./packages.nix
        ./virtualisation.nix { inherit username; }
        ./sway.nix
        ./theme.nix
    ];

    home = {
        inherit username homeDirectory;
        sessionVariables = {
            NIXPKGS_ALLOW_UNFREE = "1";
            NIXPKGS_ALLOW_INSECURE = "1";
        };
        sessionPath = [
            "$HOME/.local/bin"
        ];
    };

    xdg.userDirs = {
        createDirectories = true;
    };

    gtk = {
        gtk3 = {
            bookmarks = [
                "file://${homeDirectory}/Downloads"
                "file://${homeDirectory}/Documents"
                "file://${homeDirectory}/Pictures"
                "file://${homeDirectory}/Music"
                "file://${homeDirectory}/Public"
                "file://${homeDirectory}/Templates"
                "file://${homeDirectory}/Videos"
                "file://${homeDirectory}/Wallpapers"
                "file://${homeDirectory}/Code"
                "file://${homeDirectory}/.config"
            ];
        };
    };
    
    programs = {
        home-manager.enable = true;
    };

    home.stateVersion = "24.11";
}
