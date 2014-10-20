require_relative 'notifiers/pagerduty'
require_relative 'notifiers/slack'

module Kenobi
  class Notifier
    def self.setup(config)
      self.new.tap { |notifier| notifier.configure(config) }
    end

    def configure(config)
      configure_branches(config)
      configure_notifiers(config)
    end

    def check(payload)
      payload['branch'] = branch_from_ref(payload['ref'])

      if notify?(payload)
        notify!(payload)
      end
    end

    private

    def configure_branches(config)
      @branches = if config.key?('BRANCHES')
        config['BRANCHES'].split(',')
      else
        []
      end
    end

    def configure_notifiers(config)
      @notifiers = Notifiers.constants.map do |constant|
        klass = Notifiers.const_get(constant)
        klass.setup(config)
      end.compact
    end

    def branch_from_ref(ref)
      ref =~ %r(\Arefs/heads/) && ref[11..-1]
    end

    def notify?(payload)
      payload['forced'] && notify_branch?(payload['branch'])
    end

    def notify_branch?(branch)
      @branches.empty? || @branches.include?(branch)
    end

    def notify!(payload)
      @notifiers.each do |notifier|
        notifier.notify!(payload)
      end
    end
  end
end
