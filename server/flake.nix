{
  description = "A Nix-flake for developing Minecraft Plugins";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self , nixpkgs, ... }:
    let pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
    in {
      devShells.x86_64-linux.minecraft-dev = pkgs.mkShell {
            packages = with pkgs; [
	      papermc
              minecraft-server
              lunar-client
              jdk17
              jre17_minimal

            ];

            # TODO: Somehow make lunar stop with all these logs >:(
            shellHook = ''
                echo eula=true > eula.txt
                minecraft-server
            '';
        };
      };
}
