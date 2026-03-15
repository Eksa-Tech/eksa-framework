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

    def stylesheet_tag(filename)
      "<link rel='stylesheet' href='/css/#{filename}.css'>"
    end

    def javascript_tag(filename)
      "<script src='/js/#{filename}.js'></script>"
    end

    def asset_path(path)
      path.start_with?('/') ? path : "/#{path}"
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
        "<div class='glass' style='padding: 2rem; border-radius: 1rem; color: #ff5555; background: rgba(255,0,0,0.1); backdrop-filter: blur(10px);'>
          <h2 style='margin-top:0;'>⚠️ View Error</h2>
          <p>Template <strong>#{template_name}</strong> tidak ditemukan di:</p>
          <code style='display:block; background:rgba(0,0,0,0.2); padding:0.5rem; border-radius:0.5rem;'>#{content_path}</code>
        </div>"
      end
    end
  end
end