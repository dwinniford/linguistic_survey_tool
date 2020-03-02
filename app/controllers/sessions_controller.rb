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

    post '/sessions' do   #refactor into helper methods?
        if !params_empty? 
            user = User.find_by_name(params[:name])
            if user && user.authenticate(params[:password])
                session[:id] = user.id
                redirect '/surveys'
            else 
                @notice = "Invalid username or password."
                erb :'/sessions/login'
            end 
        else 
            @notice = "Please fill all fields."
            erb :'/sessions/login'
        end 
    end 

    get '/logout' do 
        session.clear 
        redirect "/login"
    end 
end 