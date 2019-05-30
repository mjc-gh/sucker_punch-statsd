module SuckerPunch
  module Statsd
    class NullClient
      include Singleton

      def measure(*)
        yield
      end

      def count(*)
      end
    end
  end
end
