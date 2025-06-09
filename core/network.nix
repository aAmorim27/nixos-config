{
  networking.hostName = "aamorim-latitude"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  networking.hosts = {
    "127.0.0.1" = [ 
      "local.backmarket.fr"
      "local.backmarket.fi"
      "local.backmarket.es"
      "local.backmarket.it"
      "local.backmarket.be"
      "local.backmarket.de"
      "local.backmarket.co.uk"
      "local.backmarket.at"
      "local.backmarket.com"
      "local.backmarket.nl"
      "local.backmarket.pt"
      "local.backmarket.ie" 
      "local.backmarket.gr"
      "local.backmarket.sk"
      "local.backmarket.se"
      "local.backmarket.co.jp"
      "local.backmarket.com.au"
    ];
    "::1" = [
      "local.backmarket.fr"
      "local.backmarket.fi"
      "local.backmarket.es"
      "local.backmarket.it"
      "local.backmarket.be"
      "local.backmarket.de"
      "local.backmarket.co.uk"
      "local.backmarket.at"
      "local.backmarket.com"
      "local.backmarket.nl"
      "local.backmarket.pt"
      "local.backmarket.ie" 
      "local.backmarket.gr"
      "local.backmarket.sk"
      "local.backmarket.se"
      "local.backmarket.co.jp"
      "local.backmarket.com.au"
    ];
  };
}