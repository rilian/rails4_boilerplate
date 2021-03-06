# encoding: utf-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = 'precise32'
  config.vm.box_url = 'http://files.vagrantup.com/precise32.box'
  config.vm.boot_mode = :gui

  {
    memory: 512,
    cpus: 2,
    ioapic: 'on'
  }.each do |k, v|
    config.vm.customize ['modifyvm', :id, "--#{k}", v]
  end

  config.ssh.forward_agent = true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe :apt
    chef.add_recipe 'git'
    #chef.add_recipe 'vim'
    #chef.add_recipe 'nginx'
    #chef.add_recipe 'postgresql::server'
    chef.add_recipe 'rvm::vagrant'
    chef.add_recipe 'rvm::system'
    #chef.add_recipe 'sqlite'
    chef.json = {
      :rvm => {
        :default_ruby => 'ruby-2.0.0-p247'
      },
      :git        => {
        :prefix => "/usr/local"
      },
      :nginx      => {
        :dir                => "/etc/nginx",
        :log_dir            => "/var/log/nginx",
        :binary             => "/usr/sbin/nginx",
        :user               => "www-data",
        :init_style         => "runit",
        :pid                => "/var/run/nginx.pid",
        :worker_connections => "1024"
      },
      :postgresql => {
        :config   => {
          :listen_addresses => "*",
          :port             => "5432"
        },
        :pg_hba   => [
          {
            :type   => "local",
            :db     => "postgres",
            :user   => "postgres",
            :addr   => nil,
            :method => "trust"
          },
          {
            :type   => "host",
            :db     => "all",
            :user   => "all",
            :addr   => "0.0.0.0/0",
            :method => "md5"
          },
          {
            :type   => "host",
            :db     => "all",
            :user   => "all",
            :addr   => "::1/0",
            :method => "md5"
          }
        ],
        :password => {
          :postgres => "password"
        }
      }
    }
  end
end
