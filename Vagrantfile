# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = 'precise32'

  config.vm.box_url = 'http://files.vagrantup.com/precise32.box'

  config.vm.boot_mode = :gui

  # config.vm.network :bridged

  config.vm.forward_port 80, 8080
  # [8888, 4000, 1080, 8998, 3000].each do |port|
  #   config.vm.forward_port port, port
  # end

  {
    memory: 512,
    cpus:   2,
    ioapic: 'on'
  }.each do |k, v|
    config.vm.customize ['modifyvm', :id, "--#{k}", v]
  end

  config.vm.provision :chef_solo, run_list: %w[role[develop]] do |chef|
    chef.cookbooks_path = %w[cookbooks/cookbooks cookbooks/site-cookbooks]
    chef.roles_path = 'cookbooks/roles'
    chef.data_bags_path = 'cookbooks/data_bags'

    # Box roles
    chef.add_role('develop')

    chef.add_recipe 'apt'

  end
end
