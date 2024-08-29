{ self, inputs, system, ... }:

{
  flake.overlays = {
    emacs-overlays = inputs.emacs-overlays.overlays.default;   
    
    emacs-macport-overlay = self: super: {
      emacs-macport = inputs.pkgs-emacs-macport.legacyPackages.${system}.emacs-macport;
    };

    default = 
    let 
      overlays = [
        self.overlays.emacs-overlays
        self.overlays.emacs-macport-overlay
      ];
    in
    (self: super: super.lib.composeManyExtensions overlays self super);
  };
}