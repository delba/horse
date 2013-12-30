require 'horse/version'
require 'horse/router'
require 'horse/controller'

module Horse
  class Application
    def self.call(env)
      new(env).call
    end

    attr_reader :env, :request, :response

    def initialize(env)
      @env      = env
      @request  = Rack::Request.new(env)
      @response = Rack::Response.new
    end

    def call
      response.finish do |res|
        res.write body
      end
    end

  private

    def body
      Router.resolve(request)
    end
  end
end
