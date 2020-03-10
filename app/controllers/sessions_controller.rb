class SessionsController < ApplicationController 
    
    get '/' do 
        erb :'sessions/index'
    end 

    get '/signup' do 
        if logged_in? 
            redirect '/surveys'
        else 
            @user = User.new
            erb :'sessions/signup'
        end
        
    end 

    post '/signup' do 
        @user = User.new(params)
        if @user.save
            session[:id] = @user.id
            redirect '/surveys'
        else 
            erb :'/sessions/signup'
        end 
    end 

    
    get '/login' do 
        if logged_in?
            redirect '/surveys'
        else 
            erb :'sessions/login'
        end
    end 

    post '/login' do   
        if !params_empty? 
            user = User.find_by_name(params[:name])
            if user && user.authenticate(params[:password])
                session[:id] = user.id
                redirect '/surveys'
            else 
                #raise user.errors.inspect
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
        redirect "/"
    end 
end 