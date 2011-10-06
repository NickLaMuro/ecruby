require_recipe "apt"
require_recipe "build-essential"
require_recipe "vim"
require_recipe "tmux"
require_recipe "git"
require_recipe "apache2"

%w[staticmatic].each do |gem_name|
  execute "Installing #{gem_name} gem}" do
    command "sudo gem install #{gem_name}"
    user "vagrant"
    cwd "/vagrant"
    not_if "gem list | grep staticmatic"
  end
end

execute "Building static site" do
  command "staticmatic build ."
  user "vagrant"
  cwd "/vagrant"
end

execute "disable-default-site" do
  command "sudo a2dissite default"
  # This is an older syntax for the next line, but it is still supported
  notifies :restart, resources(:service => "apache2")
end

web_app "application" do
  template "application.conf.erb"
  # This is an older syntax for the next line, but it is still supported
  notifies :restart, resources(:service => "apache2")
end

# Uncomment the following if you have some vimfiles in your dropbox folder that
# you would like to use:

#execute "Remove '~/.vim'" do
  #user "vagrant"
  #cwd "/home/vagrant"
  #command "sudo rm -rf /home/vagrant/.vim"
  #only_if File.directory?("/home/vagrant/.vim")
#end

#execute "Remove '~/.vimrc'" do
  #user "vagrant"
  #cwd "/home/vagrant"
  #command "sudo rm -rf /home/vagrant/.vimrc"
  #only_if File.exists?("/home/vagrant/.vimrc")
#end

#execute "Link up '~/Dropbox/dotfiles/.vim'" do
  #user "vagrant"
  #cwd "/home/vagrant"
  #command "sudo ln -s /home/vagrant/Dropbox/dotfiles/.vim /home/vagrant/.vim"
  #only_if File.directory?("/home/vagrant/.vim")
#end

#execute "Link up '~/Dropbox/dotfiles/.vimrc_nix'" do
  #user "vagrant"
  #cwd "/home/vagrant"
  #command "sudo ln -s /home/vagrant/Dropbox/dotfiles/.vimrc_nix /home/vagrant/.vimrc"
  #only_if File.exists?("/home/vagrant/.vimrc")
#end
