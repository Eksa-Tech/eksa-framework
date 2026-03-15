require 'rack'
require_relative 'eksa/version'
require_relative 'eksa/controller'
require_relative 'eksa/model'

module Eksa
  class Application
    attr_reader :config, :middlewares

    def initialize
      @routes = {}
      @middlewares = []
      @config = {
        db_path: File.expand_path("./db/eksa_app.db")
      }
      yield self if block_given?
      configure_framework
    end

    def configure_framework
      Eksa::Model.database_path = @config[:db_path]
    end

    def add_route(path, controller_class, action)
      @routes[path] = { controller: controller_class, action: action }
    end

    def use(middleware, *args, &block)
      @middlewares << [middleware, args, block]
    end

    def call(env)
      @app ||= build_app
      @app.call(env)
    end

    def build_app
      builder = Rack::Builder.new
      @middlewares.each do |middleware, args, block|
        builder.use(middleware, *args, &block)
      end
      builder.run(method(:core_call))
      builder.to_app
    end

    def core_call(env)
      request = Rack::Request.new(env)
      flash_message = request.cookies['eksa_flash']
      route = @routes[request.path_info]

      if route
        controller_instance = route[:controller].new(request)
        controller_instance.flash[:notice] = flash_message if flash_message
        response_data = controller_instance.send(route[:action])
        if response_data.is_a?(Array) && response_data.size == 3
          status, headers, body = response_data
          response = Rack::Response.new(body, status, headers)
        else
          response = Rack::Response.new
          if controller_instance.status == 302
            response.redirect(controller_instance.redirect_url, 302)
          else
            response.write(response_data)
            response['content-type'] = 'text/html'
          end
        end

        response.delete_cookie('eksa_flash') if flash_message
        response.finish
      else
        [404, { 'content-type' => 'text/html' }, ["<div style='font-family:sans-serif; text-align:center; padding-top:50px;'><h1>404</h1><p>Halaman tidak ditemukan di Eksa Framework.</p></div>"]]
      end
    end
  end
end