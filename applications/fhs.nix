{pkgs, config, ...}:

{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
    ];
  };
  environment.systemPackages = with pkgs; [
    (let base = pkgs.appimageTools.defaultFhsEnvArgs; in
      pkgs.buildFHSEnv (base // {
      name = "fhs";
      targetPkgs = pkgs:
        (base.targetPkgs pkgs) ++ (with pkgs; [
          pkg-config
        ]);
      profile = "export FHS=1";
      runScript = "bash";
      extraOutputsToInstall = ["dev"];
    }))
  ];
}
