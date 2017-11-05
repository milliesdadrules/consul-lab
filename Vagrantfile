Vagrant.configure("2") do |config|
  config.vm.box = "williamyeh/ubuntu-trusty64-docker"
  config.vm.provision "shell", path: "install/install.sh", privileged: false

  (1..3).each do |i|
    config.vm.define "consul-svr#{i}" do |cs|
      cs.vm.hostname = "consul-svr#{i}"
      cs.vm.network "private_network", ip: "10.20.20.1#{i}"
      #cs.vm.provision "shell", path: "provision/setup.consul-server.sh", privileged: false
    end
  end

  config.vm.define "lb" do |lb|
    lb.vm.hostname = "lb"
    lb.vm.network "private_network", ip: "10.20.20.20"
  end

  (1..2).each do |i|
    config.vm.define "web#{i}" do |ws|
      ws.vm.hostname = "web#{i}"
      ws.vm.network "private_network", ip: "10.20.20.2#{i}"
      ws.vm.provision "shell", path: "install/web.docker.sh", privileged: false
    end
  end

end