{
    inputs = {
        nixpkgs-23-11.url = "github:nixos/nixpkgs/nixos-23.11";
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        snowfall-lib = {
            url = "github:snowfallorg/lib";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
        hyprland-plugins.url = "github:hyprwm/hyprland-plugins";

        sops-nix = {
          url = "github:Mic92/sops-nix";
          inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs:
        inputs.snowfall-lib.mkFlake {
            inherit inputs;
            src = ./.;

            alias = {
                # packages.default = "";
                # shells.default = "";
                # overlays.default = "";
                # templates.default = "";
                # modules.nixos.default = "";
                # modules.darwin.default = "";
                # modules.home.default = "";
            };

            channels-config = {
                # Allow unfree packages.
                allowUnfree = true;

                # Allow certain insecure packages
                permittedInsecurePackages = [];

                # Additional configuration for specific packages.
                config = {};
            };


            snowfall = {
                root = ./nix;

                namespace = "gearshift";

                meta = {
                    name = "gearshift";

                    title = "Gearshift";
                };
            };
        };
}
