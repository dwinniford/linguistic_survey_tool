class ApplicationController < Sinatra::Base

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "walkinginricepaddies"
    end 

    

    helpers do 
        
        def current_user
            User.find(session[:id])
        end 

        def logged_in?
            !!session[:id]
        end 

        def params_empty?
            params.any? do |k, v|
                v.empty? 
            end 
        end 
    end 
    
end 