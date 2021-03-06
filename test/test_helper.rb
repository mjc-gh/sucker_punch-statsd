# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sucker_punch/statsd'
require 'minitest/autorun'

module Minitest
  class Test
    def self.test(name, &block)
      define_method "test_#{name.gsub(/\s+/, '_')}", &block
    end

    def self.setup(&block)
      define_method :setup, &block
    end

    def self.teardown(&block)
      define_method :teardown, &block
    end
  end
end

require_relative 'test_jobs'
