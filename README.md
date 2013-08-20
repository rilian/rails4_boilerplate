Rails 4 + Vagrant + Chef app
=============================================================

Features
--------------

* Rails 4.0.0
* ...

Development Steps
--------------

Add Gemfile, create gemset and install Rails 4 via `rails new --skip-test-unit`

Add `vagrant` gem and run

`vagrant init precise32 http://files.vagrantup.com/precise32.box`

Check out `Vagrant` file contents

Adding `cookbooks/` folder with empty backend role, pont Vagrant to use cookbooks from `cookbooks/`

Download latest cookbooks `cd cookbooks ; bundle ; librarian-chef install`

Run `vagrant up` to provision box by given recipes
