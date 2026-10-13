{ config, pkgs, ... }:

{
  # Kernel Sysctl Optimizations
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.max_map_count" = 2147483642;   # SteamOS value
  };

  # Compress RAM before swapping to disk
  zramSwap.enable = true;

  # Extra performance kernel parameters
  boot.kernelParams = [
    "split_lock_mitigate=0"            # Helps some games a lot
  ];

  # GameMode + Gamescope
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        renice = 10;
        softrealtime = "auto";
      };
      # Uncomment the gpu section only if you want aggressive GPU boosts
      # gpu = {
      #   apply_gpu_optimisations = "accept-responsibility";
      #   gpu_device = 0;
      #   amd_performance_level = "high";   # only for AMD
      # };
    };
  };

  programs.gamescope.enable = true;

  # Custom eBPF CPU Scheduler (scx_lavd is great for gaming)
  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
  };

  # Gaming & Performance Tools
  environment.systemPackages = with pkgs; [
    mangohud
    protonup-qt
    gamescope
    steam-run
    wineWow64Packages.stable
    winetricks
    lutris
    vulkan-tools
  ];
}
