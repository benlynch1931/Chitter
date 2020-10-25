require "sinatra"
require "./app/models/database.rb"

class ChitterApp < Sinatra::Base
  set :views, File.expand_path("../../views", __FILE__)
  set :public_folder, File.expand_path("../../public", __FILE__)
  set :root, File.dirname(__FILE__)
  enable :method_override, :sessions
  set :session_secret, ENV["SESSION_SECRET"]

  get ('/') do
    erb :index
  end

  get ('/peeps/option') do
    erb :'peeps/index'
  end

  get ('/peeps') do
    @peeps = Database.access_all
    erb(:'peeps/view')
  end

  get ('/peeps/new') do
    erb(:'peeps/new')
  end

  post ('/peeps') do
    Database.insert_peep_into_db(body: params[:peep_body])
    redirect '/peeps'
  end

  get ('/authenticate/login') do
    erb :'authenticate/login'
  end

  post ('/authenticate/login') do

  end

  get ('/authenticate/signup') do
    erb :'authenticate/signup'
  end

  post ('authenticate/signup') do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    erb :'peeps/options'
  end



  run! if app_file == $0
end
