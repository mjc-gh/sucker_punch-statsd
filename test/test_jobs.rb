class TestJob
  include SuckerPunch::Statsd

  def perform
    @called = true
  end
end
