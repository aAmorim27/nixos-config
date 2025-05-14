{pkgs,...}:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
    cursor.size = 16;
    polarity = "dark";
    opacity = {
      terminal= 0.8;
    };
  };
}