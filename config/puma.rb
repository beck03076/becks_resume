# https://www.digitalocean.com/community/tutorials/how-to-deploy-a-rails-app-with-puma-and-nginx-on-ubuntu-14-04
# Change to match your CPU core count
workers 1

# Min and Max threads per worker
threads 1, 2

app_dir = "/home/deploy/apps/becks_resume"
shared_dir = "#{app_dir}/shared"

# Default to production
rails_env = "production"
environment rails_env

# Set up socket location
bind "unix://#{shared_dir}/tmp/becks_resume.sock"

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Set master PID and state locations
pidfile "#{shared_dir}/tmp/pids/puma.pid"
state_path "#{shared_dir}/tmp/pids/puma.state"
activate_control_app

on_worker_boot do
  require "active_record"
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  ActiveRecord::Base.establish_connection(YAML.load_file("#{shared_dir}/config/database.yml")[rails_env])
end