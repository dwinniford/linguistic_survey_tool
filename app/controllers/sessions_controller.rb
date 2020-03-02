class SessionsController < ApplicationController 
    
    get '/' do 
        erb :'sessions/index'
    end 

    get '/signup' do 
        erb :'sessions/signup'
    end 

    post '/signup' do 
        if !params_empty? 
            user = User.create(params)
            session[:id] = user.id
            redirect '/surveys'
        else 
            @notice = "Please fill all fields."
            erb :'/sessions/signup'
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