class TestJob
  include SuckerPunch::Statsd

  def perform(a, b, *c)
    @called = true
    @args = [a, b, *c]
  end
end
