task routes: :environment do
  Rails.application.eager_load!
  models = ApplicationRecord.descendants.collect(&:name).join("|").downcase
  controllers = ApplicationController.descendants.collect(&:name)
  controllers = (controllers.map { |controller| controller[0..-11].downcase }).join("|")
  if models
    puts `bundle exec rails routes -g "#{models}|#{controllers}"`
  else
    puts `bundle exec rails routes -g "#{controllers}"`
  end
end
