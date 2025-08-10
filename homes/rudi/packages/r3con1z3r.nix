{ pkgs, ... }:

{
  home.packages = [
    (pkgs.python3Packages.buildPythonPackage rec { # rec makes attribute set recursive, therefore attributes can refer to each other
      pname = "r3con1z3r";
      version = "unstable";  # or a date if you want

      src = pkgs.fetchFromGitHub {
        owner = "abdulgaphy";
        repo = "r3con1z3r";
        rev = "master"; # could also use a commit hash
        sha256 = "sha256-WIaBzf7Zrijie3PkzJPtcnXTU8bcB5Adpz/ASxr/N/g=";
      };

      propagatedBuildInputs = [ pkgs.python3Packages.requests ]; # build input also needed later during runtime

      meta = with pkgs.lib; {
        description = "Lightweight OSINT web information-gathering tool";
        homepage = "https://github.com/abdulgaphy/r3con1z3r";
        license = licenses.gpl3;
      };
    })
  ];
}

