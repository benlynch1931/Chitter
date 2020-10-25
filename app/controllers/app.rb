require "sinatra"
require "./app/models/Bookmark.rb"

class BookmarkApp < Sinatra::Base
  set :views, File.expand_path("../../views", __FILE__)
  set :public_folder, File.expand_path("../../public", __FILE__)
  set :root, File.dirname(__FILE__)
  enable :method_override, :sessions
  set :session_secret, ENV["SESSION_SECRET"]

  get "/" do
    erb :index
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all_bookmarks
    erb :bookmarks
  end

  get "/add_bookmark" do
    erb(:'add_bookmarks')
  end

  post "/add_to_database" do
    Bookmark.create(params[:title], params[:url])
    redirect("/bookmarks")
  end

  get "/edit_bookmarks" do
    @bookmarks = Bookmark.all_bookmarks
    erb(:'edit_bookmarks')
  end

  delete "/delete_bookmark" do
    Bookmark.delete(params[:check])
    redirect("/bookmarks")
  end

  get "/bookmarks/:id/edit" do
    @bookmark = Bookmark.get(params["id"])
    session[:update_id] = params[:id]
    erb :'bookmarks/edit'
  end

  patch "/bookmarks/:id" do
    Bookmark.edit(id: session[:update_id], new_title: params[:title], new_url: params[:url])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end
