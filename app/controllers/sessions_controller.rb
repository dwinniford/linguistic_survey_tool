class SessionsController < ApplicationController 
    
    get '/signup' do 
        erb :'sessions/signup'
    end 
    
    get '/login' do 
        erb :'sessions/login'
    end 

    post '/sessions' do 
        session[:user_name] = params[:user_name]
        if session[:user_name].length > 0  # add real authentication
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