require 'sinatra'
require 'thin'
require 'json'
require 'sinatra/reloader' if development?

TODO_ITEMS = []

def load_tasks
  if File.exist?('tasks.json') && !File.zero?('tasks.json')
    file = File.read('tasks.json')
    TODO_ITEMS.replace(JSON.parse(file))
  end
end

def save_tasks
  File.open('tasks.json', 'w') do |file|
    file.write(TODO_ITEMS.to_json)
  end
end

load_tasks

get '/' do
  erb :index
end

post '/add' do
  new_task = {
    'task' => params[:task],
    'completed' => false,
    'priority' => params[:priority]
  }
  TODO_ITEMS << new_task unless params[:task].empty?
  save_tasks
  redirect '/'
end

post '/delete' do
  TODO_ITEMS.delete_at(params[:index].to_i) if params[:index]
  save_tasks
  redirect '/'
end

post '/complete' do
  TODO_ITEMS[params[:index].to_i]['completed'] = true
  save_tasks
  redirect '/'
end
