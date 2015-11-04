default["gaurun"]["version"] = "0.4.0"
default["gaurun"]["user"] = "gaurun"
default["gaurun"]["group"] = "gaurun"
default["gaurun"]["user_home"] = "/home/gaurun"
default["gaurun"]["install"] = "source"
default["gaurun"]["install_prefix"] = "/opt"
default["gaurun"]["conf_dir"] = "/etc/gaurun"
default["gaurun"]["conf_file"] = "#{default["gaurun"]["conf_dir"]}/gaurun.toml"
default["gaurun"]["init_file"] = "/etc/init.d/gaurun"
default["gaurun"]["versions"] = {
    "0.4.0" => {
        "url"       => "https://github.com/mercari/gaurun/archive/v0.4.0.tar.gz",
        "checksum"  => "7dac8eb330e6af21b5f5e219c367233cbdf19f7d138ce14bbb80cdb64882f22e",
    }
}

default["gaurun"]["config"] = {}
