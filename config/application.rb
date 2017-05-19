require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DoubleHRanch
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.assets.paths << Rails.root.join("node_modules")

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # paperclip S3
    # config.paperclip_defaults = {
    #   storage: :s3,
    #   s3_region: 'us-east-1',
    #   s3_credentials: {
    #     s3_host_name: "s3-us-east-1.amazonaws.com",
    #     bucket: "doublehranch-#{Rails.env}",
    #     access_key_id: Rails.application.secrets[:aws_access_key_id],
    #     secret_access_key: Rails.application.secrets[:aws_secret_access_key]
    #   }
    # }
  end
end

