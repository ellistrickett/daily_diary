require 'sinatra/base'
require './lib/diary.rb'

class DailyDiary < Sinatra::Base
  get '/' do 
    $diary = Diary.all
    @diary = $diary
    erb :index
  end

end