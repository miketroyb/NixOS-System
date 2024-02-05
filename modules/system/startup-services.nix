{
systemd.user.services.startup = {
  script = ''
	protonmail-bridge -n
  '';
  wantedBy = [ "graphical-session.target" ];
  partOf = [ "graphical-session.target" ];
};
}
