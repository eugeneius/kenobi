require 'slack-notifier'

module Kenobi
  module Notifiers
    class Slack
      def self.setup(config)
        if config.key?('SLACK_TEAM') && config.key?('SLACK_TOKEN')
          self.new(config)
        end
      end

      def initialize(config)
        @notifier = ::Slack::Notifier.new(config['SLACK_TEAM'], config['SLACK_TOKEN'])
      end

      def notify!(payload)
        @notifier.ping(message(payload))
      end

      private

      def message(payload)
        branch = payload['branch']
        repo = payload['repository']['full_name']
        before = payload['before']
        after = payload['after']

        "I sense that the #{branch} branch of #{repo} was force pushed from #{before} to #{after}."
      end
    end
  end
end
