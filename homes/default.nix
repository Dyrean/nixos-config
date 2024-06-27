{ username, ... }: {
    home-manager = {
        # tell home-manager to be as verbose as possible
        verbose = true;

        # use the system configuration’s pkgs argument
        # this ensures parity between nixos' pkgs and hm's pkgs
        useGlobalPkgs = true;

        # enable the usage user packages through
        # the users.users.<name>.packages option
        useUserPackages = true;

        # move existing files to the .old suffix rather than failing
        # with a very long error message about it
        backupFileExtension = "backup";

        # per-user Home Manager configuration
        users = {
            # name of the user = directory
            # more users can be added this way
            # as long as their home directories exist
            "${username}" = ./${username};
        };
    };
}

