class SessionsController < ApplicationController 
    
    get '/' do 
        erb :'sessions/index'
    end 

    get '/signup' do 
        erb :'sessions/signup'
    end 

    post '/signup' do 
        if params[:name].length > 0 && params[:password].length > 0 
            User.create(params)
            redirect '/login'
        else 
            redirect '/failure'
        end 
    end 

    
    get '/login' do 
        erb :'sessions/login'
    end 

    post '/sessions' do 
        session[:name] = params[:name]
        if session[:name].length > 0  # add real authentication
            redirect "/users"
        else 
            redirect "/login" # add user id in the uri
        end 
    end 

    get '/logout' do 
        sessions.clear 
        redirect :"/sessions/login"
    end 
end 