require 'erb'

module Eksa
  class Controller
    attr_reader :request
    attr_accessor :status, :redirect_url, :flash

    def initialize(request)
      @request = request
      @status = 200
      @flash = {}
    end

    def params
      @request.params
    end

    def redirect_to(url, notice: nil)
      @status = 302
      @redirect_url = url
      @flash[:notice] = notice if notice
      nil
    end

    def render(template_name, variables = {})
      variables.each { |k, v| instance_variable_set("@#{k}", v) }

      content_path = File.expand_path("./app/views/#{template_name}.html.erb")
      layout_path  = File.expand_path("./app/views/layout.html.erb")

      if File.exist?(content_path)
        @content = ERB.new(File.read(content_path)).result(binding)
        if File.exist?(layout_path)
          ERB.new(File.read(layout_path)).result(binding)
        else
          @content
        end
      else
        "Error: View '#{template_name}' tidak ditemukan."
      end
    end
  end
end