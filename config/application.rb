require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Baseball
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.autoload_paths += %W(#{config.root}/app)

    config_files = []
    config_files << ['development.yml'] if Rails.env.development?
    config_files.each do |file_name|
      file_path = File.join(Rails.root, 'config', file_name)
      config_keys = HashWithIndifferentAccess.new(YAML::load(IO.read(file_path)))[Rails.env]
      config_keys.each do |k,v|
        ENV[k.upcase] ||= v
      end
    end
  end
end

