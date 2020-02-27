class SessionsController < ApplicationController 
    get '/login' do 
        erb :'sessions/login'
    end 

    post '/sessions' do 
        session[:user_name] = params[:user_name]
        redirect "/users" # add user id in the uri
    end 
end 