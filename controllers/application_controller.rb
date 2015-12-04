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
    q = params['question']
    result = `cd python; python qa_local.py #{q} seg_qa.json`
    logger.info q
    logger.info result
    result
    
  end
  
###############################################
  app_get_root = lambda do
    logger.info `ls`
    redirect '/index.html'   
  end
  
  # Web App Views Routes
  get '/', &app_get_root
 
end
