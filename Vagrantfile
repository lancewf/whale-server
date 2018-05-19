$enter_studio = <<SCRIPT
tee "/etc/profile.d/hab_setup.sh" > "/dev/null" <<EOF
$(curl -s -L https://gist.githubusercontent.com/lancewf/16700007266f7548150e9fdedcecbf2f/raw/0403ff24b071298dd91bd08d251c699ec09def2a/deploy.sh)
EOF

SCRIPT

$mkdir_config = <<SCRIPT

mkdir /whale_server
chmod 777 /whale_server

SCRIPT

$install_hab = <<SCRIPT
curl https://raw.githubusercontent.com/habitat-sh/habitat/master/components/hab/install.sh | sudo bash -s -- -v 0.54.0
adduser --group hab
useradd -g hab hab
tee "/lib/systemd/system/hab.service" > "/dev/null" <<EOF
[Unit]
Description=The Habitat Supervisor

[Service]
ExecStart=/bin/hab sup run

[Install]
WantedBy=default.target

EOF

systemctl enable hab
systemctl start hab

ufw allow ssh
ufw allow http
ufw enable

hab pkg install chef/ci-studio-common >/dev/null

mkdir -p /hab/user/whale-server/config
cp /whale_server/svc_config/whale_server.toml /hab/user/whale-server/config/user.toml

mkdir -p /hab/user/mysql/config
cp /whale_server/svc_config/mysql.toml /hab/user/mysql/config/user.toml

mkdir -p /hab/user/php/config
cp /whale_server/svc_config/php.toml /hab/user/php/config/user.toml

mkdir -p /hab/user/mmsn/config
cp /whale_server/svc_config/mmsn.toml /hab/user/mmsn/config/user.toml

mkdir -p /hab/user/Money-Checker-Server/config
cp /whale_server/svc_config/money_checker_server.toml /hab/user/Money-Checker-Server/config/user.toml

mkdir -p /hab/user/wiki/config
cp /whale_server/svc_config/wiki.toml /hab/user/wiki/config/user.toml

mkdir -p /hab/user/whaledisentanglement_home/config
cp /whale_server/svc_config/whaledisentanglement_home.toml /hab/user/whaledisentanglement_home/config/user.toml

mkdir -p /hab/user/hawaii-alaska-whaledisentanglement/config
cp /whale_server/svc_config/hawaii_alaska_whaledisentanglement.toml /hab/user/hawaii-alaska-whaledisentanglement/config/user.toml

mkdir -p /hab/user/media-whaledisentanglement/config
cp /whale_server/svc_config/media_whaledisentanglement.toml /hab/user/media-whaledisentanglement/config/user.toml

mkdir -p /hab/user/west-coast-whaledisentanglement/config
cp /whale_server/svc_config/west_coast_whaledisentanglement.toml /hab/user/west-coast-whaledisentanglement/config/user.toml

mkdir -p /hab/user/pacific-northwest-whaledisentanglement/config
cp /whale_server/svc_config/pacific_northwest_whaledisentanglement.toml /hab/user/pacific-northwest-whaledisentanglement/config/user.toml

mkdir -p /hab/user/west_coast_training_whaledisentanglement/config
cp /whale_server/svc_config/west_coast_training_whaledisentanglement.toml /hab/user/west_coast_training_whaledisentanglement/config/user.toml

mkdir -p /hab/user/money_data_server/config
cp /whale_server/svc_config/money_data_server.toml /hab/user/money_data_server/config/user.toml

SCRIPT


Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.provider "virtualbox" do |v|
    v.memory = 8192
    v.cpus = 4
  end

  config.vm.hostname = 'seal.test'
  config.vm.network 'private_network', ip: '192.168.11.111'

  config.vm.provision "shell", inline: $mkdir_config
  config.vm.provision "file", source: "svc_config", destination: "/whale_server"
  config.vm.provision "shell", inline: $install_hab
  config.vm.provision "shell", inline: $enter_studio, run: "always"

end
