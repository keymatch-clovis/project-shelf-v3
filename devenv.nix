{ pkgs, lib, config, inputs, ... }:

{
    packages = [
        pkgs.sqlite
    ];

    # As I'm using Nix, I need to use this fix:
    # https://discourse.nixos.org/t/libsqlite3-so-no-such-file-or-directory/58556
    env.LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath (with pkgs; [ sqlite ])}:$LD_LIBRARY_PATH";

    languages.rust = {
        enable = true;
    };
}
