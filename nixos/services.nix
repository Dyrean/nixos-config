{ pkgs, ... }:

{
	# Systemd services setup
	# systemd.packages = with pkgs; [
	#   auto-cpufreq
	# ];

	# services.auto-cpufreq.enable = true;

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;
  
    programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
            # Add any missing dynamic libraries for unpackaged programs
            # here, NOT in environment.systemPackages
        ];
    };

	environment.systemPackages = with pkgs; [
		wl-screenrec
		wl-clipboard
		wl-clip-persist
		cliphist
		xdg-utils
		wlrctl
	];
}
