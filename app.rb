require 'sinatra'
require 'sinatra/reloader' if development?

TODO_ITEMS = []

get '/' do
  erb :index
end

post '/add' do
  TODO_ITEMS << params[:task] unless params[:task].empty?
  redirect '/'
end

post '/delete' do
  TODO_ITEMS.delete_at(params[:index].to_i) if params[:index]
  redirect '/'
end

