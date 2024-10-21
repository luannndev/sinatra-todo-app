require 'sinatra'
require 'thin'
require 'json'
require 'sinatra/reloader' if development?
require 'securerandom'

TODO_ITEMS = []
USERS = []

def load_tasks
  if File.exist?('tasks.json') && !File.zero?('tasks.json')
    file = File.read('tasks.json')
    TODO_ITEMS.replace(JSON.parse(file))
  end
end

def load_users
  if File.exist?('users.json') && !File.zero?('users.json')
    file = File.read('users.json')
    USERS.replace(JSON.parse(file))
  end
end

def save_tasks
  File.open('tasks.json', 'w') do |file|
    file.write(TODO_ITEMS.to_json)
  end
end

def save_users
  File.open('users.json', 'w') do |file|
    file.write(USERS.to_json)
  end
end

load_tasks
load_users

enable :sessions

get '/' do
  @search_query = params[:search]
  @filtered_tasks = if @search_query
                      TODO_ITEMS.select { |task| task['task'].include?(@search_query) }
                    else
                      TODO_ITEMS
                    end
  erb :index
end

post '/add' do
  new_task = {
    'task' => params[:task],
    'completed' => false,
    'priority' => params[:priority],
    'category' => params[:category],
    'due_date' => params[:due_date]
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

get '/edit/:index' do
  @task = TODO_ITEMS[params[:index].to_i]
  @index = params[:index]
  erb :edit
end

post '/update/:index' do
  TODO_ITEMS[params[:index].to_i]['task'] = params[:task]
  TODO_ITEMS[params[:index].to_i]['priority'] = params[:priority]
  TODO_ITEMS[params[:index].to_i]['category'] = params[:category]
  TODO_ITEMS[params[:index].to_i]['due_date'] = params[:due_date]
  save_tasks
  redirect '/'
end

get '/register' do
  erb :register
end

post '/register' do
  existing_user = USERS.find { |user| user['username'] == params[:username] }
  if existing_user
    @error = "Benutzername bereits vergeben."
    return erb :register
  end

  new_user = {
    'username' => params[:username],
    'password' => params[:password]
  }
  USERS << new_user
  save_users
  redirect '/login'
end

get '/login' do
  erb :login
end

post '/login' do
  user = USERS.find { |u| u['username'] == params[:username] && u['password'] == params[:password] }
  if user
    session[:username] = user['username']
    redirect '/'
  else
    @error = "Ungültige Anmeldedaten."
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect '/login'
end
