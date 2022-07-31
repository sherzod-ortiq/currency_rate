ENV.each { |k, v| env(k, v) }
rails_env =  ENV.fetch("RAILS_ENV") { "development" }
set :environment_variable, "RAILS_ENV"
set :environment, rails_env
# sidekiq is service name
set :output, "log/sidekiq-cron-#{rails_env}.log"

job_type :rake, "cd :path && :environment_variable=:environment bundle exec rake :task --silent :output"

every 1.minute do
	rake "rates:update_currency_rates"
end