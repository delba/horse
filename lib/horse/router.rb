module Horse
  class Router
    def self.resolve(request)
      new(request).resolve
    end

    attr_reader :request

    def initialize(request)
      @request = request
    end

    def resolve
      return if path_info == '/favicon.ico'

      controller.public_send action
    end

  private

    def controller
      controller_class.new
    end

    def action
      match[:action]
    end

    def controller_class
      require "#{match[:controller]}_controller"

      Object.const_get "#{match[:controller].capitalize}Controller"
    end

    def match
      @match ||= begin
        path_info.match %r(/(?<controller>.+)/(?<action>.+))
      end
    end

    def path_info
      request.path_info
    end
  end
end

