Chef::Log.info("Running deploy/after_restart.rb")


current_release = release_path

node[:deploy].each do |application, deploy|
  rails_env = deploy[:rails_env] || 'production'
  ENV = node[:deploy][:appname][:environment_variables]

  execute "restart puma" do
    command "sudo su - #{deploy[:user]} -c 'cd /srv/www/[appname]/ && /usr/local/bin/bundle exec puma -C config/puma.rb"
  end
end
