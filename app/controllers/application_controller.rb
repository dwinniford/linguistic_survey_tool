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

        def valid_age?(num)
            num > 0 && num < 115
        end

        def valid_name?(str)
            str.downcase.match?(/[ a-z]/)
        end

        def valid_input?
            valid_age?(params["survey"]["age"].to_i) && valid_name?(params["survey"]["name"])
        end

    end 
    
end 