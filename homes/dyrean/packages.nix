{ pkgs, ... }: {
    
    home = {
        packages = with pkgs; with nodePackages_latest; with gnome; with libsForQt5; [
            sway
            mold
            gnumake
            cmake
            gcc14
            gcc

            # gui
            blueberry
            (mpv.override { scripts = [ mpvScripts.mpris ]; })
            d-spy
            kolourpaint
            gnome.nautilus
            icon-library
            dconf-editor
            qt5.qtimageformats
            vlc

            # tools
            bat
            eza
            fd
            ripgrep
            fzf
            jq
            ffmpeg
            libnotify
            killall
            zip
            unzip
            glib
            showmethekey
            fastfetch
            onefetch
            ipfetch
            btop
            gping
            gitleaks
            git
            tealdeer
            stow
            yazi
            tokei
            atuin
            vscode
            vim
            neovim
            alacritty
            zellij
            oh-my-posh
            zoxide
            lazygit
            lazydocker
    		docker-credential-helpers

            # theming tools
            gradience
            gnome-tweaks

            # hyprland
            brightnessctl
            cliphist
            grim
            hyprpicker
            pavucontrol
            playerctl
            swappy
            slurp
            swww
            wl-clipboard

            # langs
            nodejs
            gjs
            bun
            go
            typescript
            eslint
            air
            just
            nodejs
            rustup
            gnumake
            zig
            lua

            # lsp
            tailwindcss-language-server
            lua-language-server #Lua
            gopls
            zls
            nixd
            clang-tools #C
            gopls #Golang
            rust-analyzer #Rust
            vscode-langservers-extracted #HTML,CSS, JSON
            typescript-language-server #Javascript and Typescript
            bash-language-server #Bash
            dockerfile-language-server-nodejs #Dockerfiles
            yaml-language-server #Yaml
            vscode-extensions.tamasfe.even-better-toml
        ];
    };

}
