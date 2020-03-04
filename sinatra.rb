require 'sinatra'
require 'sqlite3'
require './models/user'
get '/' do
    @users = User.all
    erb :index
end

get '/new' do
    erb :new
end

post '/create' do
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.save
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

put '/update' do
    erb :show
end

delete '/delete' do
    erb :index
end

