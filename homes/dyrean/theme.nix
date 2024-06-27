{ pkgs, ... }: {

    home.packages = with pkgs; [
       (nerdfonts.override { fonts = [ "GeistMono" "JetBrainsMono" ]; })
       bibata-cursors
       tokyonight-gtk-theme
       morewaita-icon-theme
    ];

    gtk = {
        enable = true;
        font = {
            name = "GeistMono Nerd Font";
            package = pkgs.nerdfonts.override { fonts = [ "GeistMono" ]; };
            size = 12;
        };
        cursorTheme = {
            name = "Bibata-Modern-Ice";
            package = pkgs.bibata-cursors;
        };
        iconTheme = {
            name = "MoreWaita";
            package = pkgs.morewaita-icon-theme;
        };
        theme = {
            name = "Tokyo-Night-GTK-Theme";
            package = pkgs.tokyonight-gtk-theme;
        };
        gtk3.extraConfig = {
            Settings = ''
                gtk-application-prefer-dark-theme=1
            '';
        };
        gtk4.extraConfig = {
            Settings = ''
                gtk-application-prefer-dark-theme=1
            '';
        };
    };
}
