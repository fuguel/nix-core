{ config, pkgs, ...}:
{
   services.prometheus = 
     {
        enable = true;
        port = 9090;
           scrapeConfigs = [
               {
                 job_name = "prometheus";
                 static_configs = [{ targets = [ "127.0.0.1:9090" ]; }];
                }

               { 
                 job_name = "node-exporter";
                 static_configs = [{ targets = 
                                     [ "127.0.0.1:${toStringconfig.services.prometheus.exporters.node.port}" ]; }];
                } 
                            ];


