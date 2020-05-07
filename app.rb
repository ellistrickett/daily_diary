require 'sinatra/base'
require './lib/entry'

class DailyDiary < Sinatra::Base

  get '/' do 
    $diary = Entry.all
    @diary = $diary
    erb :index
  end

  post '/add-entry' do 
    Entry.add(params[:title])
    redirect('/')
  end

  get '/entries/:id' do 
    @found_entry = Entry.find(:id)
    erb :entry
  end



end