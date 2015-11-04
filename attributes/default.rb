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

default["gaurun"]["config"] = {
    "core" => {
        "port" => "80",
        "workers" => 8,
        "queues" => 8192,
        "notification_max" => 100,
    },
    "api" => {
        "push_uri" => "/push",
        "stat_go_uri" => "/stat/go",
        "stat_app_uri" => "/stat/app",
        "config_app_url" => "/config/app"
    },
    "android" => {
        "apikey" => "",
        "enabled" => "true",
        "timeout" => 5, # sec
        "retry_max" => 0,
    }
    ,"ios" => {
        "pem_cert_path" => "cert.pem",
        "pem_key_path" => "key.pem",
        "sandbox" => "true",
        "enabled" => "true",
        "keepalive_max" => 0,
        "keepalive_idle_timeout" => 300,
        "retry_max" => 1,
        "timeout_error" => 500, # msec
    },
    "log" => {
        "access_log" => "stdout",
        "error_log" => "stderr",
        "level" => "error",
    }
}
