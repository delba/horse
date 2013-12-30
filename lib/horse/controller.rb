module Horse
  class Controller

  private

    def render(view)
      File.read template_path(view)
    end

    def template_path(view)
      File.join('app', 'views', controller_name, "#{view}.html.erb")
    end

    def controller_name
      self.class.name.sub(/Controller\z/, '').downcase
    end
  end
end
