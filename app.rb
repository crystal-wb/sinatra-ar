require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './models/user'
set :database, { adapter: "sqlite3", database: "crystaldb.db" }

get '/' do
    @users = User.all
    erb :user_list
end

get '/new' do
    erb :user_form
end

post '/create' do
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    if @user.save
        @message = "#{@user.name} was created"
    else
        @message = "user couldn't be created"
    end
    erb :show
end

get '/show' do
    @user = User.find(params[:id])
    erb :show
end

get '/edit' do
    @user = User.find(params[:id])
    erb :edit
end

post '/update' do
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if @user.save
        @message = "#{@user.name} was created"
    else
        @message = "user couldn't be created"
    end
    erb :show
end

get '/remove' do
    @users = User.all
    erb :user_delete
end

post '/delete' do
    @users = User.all
    user = User.find(params[:id])
    if user.destroy
        @message = "#{user.name} has been removed"
        erb :user_list
    else
        @message = "#{user.name} couldn't be deleted"
        erb :user_delete
    end
    
end