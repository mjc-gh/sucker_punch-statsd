module SuckerPunch
  module Statsd
    class NullClient
      include Singleton

      def time(*)
        yield
      end

      def count(*)
      end
    end
  end
end
