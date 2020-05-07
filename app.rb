require 'sinatra/base'
require './lib/diary.rb'

class DailyDiary < Sinatra::Base

  get '/' do 
    $diary = Diary.all
    @diary = $diary
    erb :index
  end

  post '/add-entry' do 
    Diary.add(params[:title])
    redirect('/')
  end

end