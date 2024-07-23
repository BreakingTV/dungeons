{
  description = "A Nix-flake for developing Minecraft Plugins";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
  };

  outputs = { self , nixpkgs, nix-minecraft, inputs,  ... }:
    let pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
    in {
      devShells.x86_64-linux.minecraft-dev = pkgs.mkShell {
            packages = with pkgs; [
                prismlauncher
            ];

            imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
            nixpkgs.overlays = [ nix-minecraft.overlay ];
            services.minecraft-servers = {
              enable = true;
              eula = true;

              servers.dungeons = {
                enable = true;
                package = pkgs.vanillaServers.vanilla;
                };
            };

            shellHook = ''
                prismlauncher
            '';
        };
      };
}
