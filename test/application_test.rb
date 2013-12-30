require_relative 'test_helper'

class ApplicationTest < Minitest::Test
  include Rack::Test::Methods

  def test_request
    skip
    get '/items/index'

    assert last_response.ok?
  end

private

  def app
    Foo::Application
  end
end
