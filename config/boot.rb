ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'rails/commands/server'
  module Rails
    class Server
      def default_options
        super.merge(Host: "192.168.1.55", Port:4002)
      end
    end
end
