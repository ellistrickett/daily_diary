require 'sinatra/base'

class DailyDiary < Sinatra::Base
  get '/' do 
    'Hello, World!'
  end
  
end