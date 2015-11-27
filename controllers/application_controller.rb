require 'sinatra/base'
require 'sinatra/flash'
require 'slim'
##
# Simple web service to delver codebadges functionality
class ApplicationController < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  configure :development do
    set :api_server, 'http://localhost:9292'
  end

  configure :production do
    set :api_server, 'http://hc2015gov.herokuapp.com'
  end

  configure :production, :development do
    enable :logging
  end

  helpers do
    def current_page?(path = ' ')
      path_info = request.path_info
      path_info += ' ' if path_info == '/'
      request_path = path_info.split '/'
      request_path[1] == path
    end
  end


  app_get_root = lambda do
    slim :home
  end

  # Web App Views Routes
  get '/', &app_get_root
 
end
