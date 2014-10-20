require 'slack-notifier'

module Kenobi
  module Notifiers
    class Slack
      ICON_URL = 'http://upload.wikimedia.org/wikipedia/en/3/32/Ben_Kenobi.png'

      def self.setup(config)
        if config.key?('SLACK_TEAM') && config.key?('SLACK_TOKEN')
          self.new(config)
        end
      end

      def initialize(config)
        @notifier = ::Slack::Notifier.new(config['SLACK_TEAM'], config['SLACK_TOKEN'])

        @notifier.username = "Kenobi"

        if config.key?('SLACK_CHANNEL')
          @notifier.channel = config['SLACK_CHANNEL']
        end
      end

      def notify!(payload)
        @notifier.ping(message(payload), icon_url: ICON_URL)
      end

      private

      def message(payload)
        branch = payload['ref']
        repo = payload['repository']['full_name']
        before = payload['before']
        after = payload['after']

        "I sense that the #{branch} branch of #{repo} was force pushed from #{before} to #{after}."
      end
    end
  end
end
