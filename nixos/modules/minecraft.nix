{ pkgs, ... }:

let
  libs = with pkgs; [
    # GTK / JavaFX UI
    gtk3
    glib
    cairo
    pango
    atk
    gdk-pixbuf
    harfbuzz
    freetype
    fontconfig

    # Audio
    alsa-lib
    openal
    libpulseaudio

    # Graphics
    libglvnd

    # X11
    libx11
    libxext
    libxrender
    libxtst
    libxi
    libxrandr
    libxcursor
    libxxf86vm
  ];

  launcherScript = pkgs.writeShellScriptBin "minecraft-launcher" ''
    export LD_LIBRARY_PATH="/run/opengl-driver/lib:${pkgs.lib.makeLibraryPath libs}"

    export __NV_PRIME_RENDER_OFFLOAD=1
    export __GLX_VENDOR_LIBRARY_NAME=nvidia

    exec ${pkgs.jdk25}/bin/java \
      -Djdk.gtk.version=3 \
      -jar /mnt/D/GAMES/SKlauncher-3.2.18.jar "$@"
  '';
in
{
  environment.systemPackages = [ launcherScript ];
}
