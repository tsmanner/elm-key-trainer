with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    elmPackages.elm
    elmPackages.elm-format
  ];
}
