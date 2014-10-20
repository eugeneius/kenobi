require 'pagerduty'

module Kenobi
  module Notifiers
    class Pagerduty
      CLIENT = 'Kenobi'

      def self.setup(config)
        if config.key?('PAGERDUTY_SERVICE_KEY')
          self.new(config)
        end
      end

      def initialize(config)
        @pagerduty = ::Pagerduty.new(config['PAGERDUTY_SERVICE_KEY'])
      end

      def notify!(payload)
        @pagerduty.trigger(message(payload), client: CLIENT, details: details(payload))
      end

      private

      def message(payload)
        repo = payload['repository']['full_name']
        "#{repo} force pushed!"
      end

      def details(payload)
        {
          'branch' => payload['ref'],
          'repo' => payload['repository']['full_name'],
          'before' => payload['before'],
          'after' => payload['after']
        }
      end
    end
  end
end
