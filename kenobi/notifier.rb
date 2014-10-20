require_relative 'notifiers/pagerduty'
require_relative 'notifiers/slack'

module Kenobi
  class Notifier
    def self.setup(config)
      self.new.tap { |notifier| notifier.configure(config) }
    end

    def configure(config)
      @notifiers = Notifiers.constants.map do |constant|
        klass = Notifiers.const_get(constant)
        klass.setup(config)
      end.compact
    end

    def check(payload)
      if payload['forced']
        notify!(payload)
      end
    end

    private

    def notify!(payload)
      @notifiers.each do |notifier|
        notifier.notify!(payload)
      end
    end
  end
end
