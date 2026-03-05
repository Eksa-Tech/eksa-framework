require 'rack'
require_relative 'eksa/version'
require_relative 'eksa/controller'
require_relative 'eksa/model'

module Eksa
  class Application
    def initialize
      @routes = {}
    end

    def add_route(path, controller_class, action)
      @routes[path] = { controller: controller_class, action: action }
    end

    def call(env)
      request = Rack::Request.new(env)
      flash_message = request.cookies['eksa_flash']
      route = @routes[request.path_info]

      if route
        controller_instance = route[:controller].new(request)
        controller_instance.flash[:notice] = flash_message if flash_message
        
        response_body = controller_instance.send(route[:action])
        
        response = Rack::Response.new

        if controller_instance.status == 302
          response.redirect(controller_instance.redirect_url, 302)
        else
          response.write(response_body)
          response['content-type'] = 'text/html'
        end

        response.delete_cookie('eksa_flash') if flash_message
        response.finish
      else
        [404, { 'content-type' => 'text/html' }, ["<h1>404 - Not Found</h1>"]]
      end
    end
  end
end