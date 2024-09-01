pkgs:
let
  commonAutoPairs = {
    "(" = ")";
    "{" = "}";
    "[" = "]";
    "<" = ">";
    "'" = "'";
    "\"" = "\"";
  };
  commonRoots = [ "flake.lock" "package-lock.json" "yarn.lock" "pnpm-lock" "bun.lockb" ];
in {
  language = [
    {
      name = "nix";
      scope = "source.nix";
      file-types = ["nix"];
      roots = ["flake.lock"];
      formatter.command = "nixpkgs-fmt";
    }
}
