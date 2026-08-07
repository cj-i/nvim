{
  description = "Neovim with LSP dev shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];

    # A helper function to generate outputs for each system
    # It imports nixpkgs for the system and passes the resulting 'pkgs' to the function 'f'
    forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f (import nixpkgs {inherit system;}));
  in {
    packages = forAllSystems (
      pkgs: let
        pkgList = with pkgs; [
          # LSPs
          vscode-langservers-extracted
          vim-language-server
          bash-language-server
          docker-language-server
          lua-language-server
          angular-language-server
          svelte-language-server
          typescript-language-server
          tailwindcss-language-server
          python314Packages.python-lsp-server
          java-language-server
          kotlin-language-server
          yaml-language-server
          rust-analyzer
          nixd

          # formatters
          rustfmt
          ast-grep
          # stylua

          lua5_1
          luarocks
          tree-sitter
          ripgrep
          gcc
					cargo
          fzf
          gnumake
        ];
      in {
        default = inputs.wrappers.wrappers.neovim.wrap {
          inherit pkgs;
          env = {
            "CONFIG_ROOT" = ./.;
            "NVIM_APPNAME" = "nvim-remote";
          };
          runtimePkgs = pkgList;
          settings.config_directory = ./.;
        };
      }
    );
  };
}
