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

        # def valid_age?(num)
        #     num > 0 && num < 115
        # end

        # def valid_name?(str)
        #     str.downcase.chars.none? { |c| !c.match?(/[ a-z]/) }
        # end

        # def valid_language?(str)
        #     str.downcase.chars.none? { |c| !c.match?(/[ a-z]/) }
        #     #separate method in case I want to make the validation more specific
        # end

        # def valid_location?(hash)
        #     hash.none? do |k, v|
        #         v.downcase.chars.any? { |c| !c.match?(/[a-z]/) }
        #     end
        # end

        # def valid_input?
        #     valid_age?(params["survey"]["age"].to_i) && valid_name?(params["survey"]["name"]) && valid_language?(params["survey"]["first_language"]) && valid_language?(params["survey"]["second_language"]) && valid_location?(params["location"])
        # end

    end 
    
end 