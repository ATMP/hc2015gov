require 'sinatra/base'
require 'sinatra/flash'
require 'slim'
##
# Simple web service to delver codebadges functionality
class ApplicationController < Sinatra::Base
  enable :sessions
  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  configure :production, :development do
    enable :logging
  end

  get "/api/v1/question" do
    params['question']
  end
  
###############################################
  app_get_root = lambda do
    redirect '/index.html'   
  end
  
  # Web App Views Routes
  get '/', &app_get_root
 
end
