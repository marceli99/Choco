require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module YourAppName
  class Application < Rails::Application
    config.before_configuration do
      require 'psych'

      # Redefine Psych.safe_load to enable aliases by default
      class << Psych
        alias_method :original_safe_load, :safe_load

        def safe_load(yaml, *args, **kwargs)
          kwargs[:aliases] = true
          original_safe_load(yaml, *args, **kwargs)
        end
      end
    end
  end
end
