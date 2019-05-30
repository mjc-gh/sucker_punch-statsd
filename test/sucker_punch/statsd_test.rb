require 'test_helper'

class SuckerPunch::StatsdTest < Minitest::Test
  teardown { SuckerPunch::Statsd.configure client: nil }

  test 'defines a version' do
    refute_nil ::SuckerPunch::Statsd::VERSION
  end

  test 'invokes statsd client measure' do
    mock_client = Minitest::Mock.new
    mock_client.expect :measure, nil, %w(TestJob)

    SuckerPunch::Statsd.configure client: mock_client
    TestJob.new.perform

    mock_client.verify
  end

  test 'invokes stats client measure with namespace' do
    mock_client = Minitest::Mock.new
    mock_client.expect :measure, nil, %w(statslol.TestJob)

    SuckerPunch::Statsd.configure client: mock_client, namespace: 'statslol'
    TestJob.new.perform

    mock_client.verify
  end

  test 'invokes perform on job' do
    job = TestJob.new
    job.perform

    assert job.instance_variable_get(:@called)
  end
end
