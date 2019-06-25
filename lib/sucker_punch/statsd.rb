require 'singleton'

require 'sucker_punch/statsd/version'
require 'sucker_punch/statsd/null_client'

module SuckerPunch
  module Statsd
    def self.configure(namespace: nil, client:)
      @namespace = namespace
      @client = client
    end

    def self.client
      @client || NullClient.instance
    end

    def self.namespace
      @namespace
    end

    def self.included(base)
      base.prepend PrependMethods
      base.extend ClassMethods
    end

    module ClassMethods
      def stats_namespace
        namespace = ''
        namespace << "#{Statsd.namespace}." unless Statsd.namespace.nil?
        namespace << name
        namespace
      end
    end

    module PrependMethods
      def perform(*)
        SuckerPunch::Statsd.client.measure self.class.stats_namespace do
          super
        end
      end
    end
  end
end
