Vagrant::Config.run do |config|
  config.vm.box = "lucid32"

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe("vagrant_main")
    chef.cookbooks_path = ["cookbooks"]
  end

  config.vm.forward_port("web", 80, 8080)

  # Uncomment if you have some vimfile in your dropbox folder that you would
  # like to use:

  # config.vm.share_folder("dropbox-dotfiles", "~/Dropbox/dotfiles/", "~/Dropbox/dotfiles/")

end
