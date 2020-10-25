require "sinatra"
# require "./app/models/Bookmark.rb"

class BookmarkApp < Sinatra::Base
  set :views, File.expand_path("../../views", __FILE__)
  set :public_folder, File.expand_path("../../public", __FILE__)
  set :root, File.dirname(__FILE__)
  enable :method_override, :sessions
  set :session_secret, ENV["SESSION_SECRET"]


  run! if app_file == $0
end
