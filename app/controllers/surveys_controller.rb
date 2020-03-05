class SurveysController < ApplicationController

    get '/surveys' do 
        if logged_in? 
            @surveys = Survey.all 
            @user = current_user 
            erb :"/surveys/index"
        else
            redirect '/'
        end 
    end 

    get '/surveys/new' do 
        @survey = Survey.new 
        @survey.build_location
        if logged_in?
            @locations = Location.all 
            erb :"/surveys/new"
        else 
            redirect '/'
        end 
    end 

    post '/surveys' do 
        # if  logged_in?
        user = User.find_by_id(session[:id])
        @survey = Survey.new(params["survey"])
        # params["survey"]["location"]
        location = Location.find_by(params["location"])
        if location 
            @survey.location= location 
        else 
            @survey.build_location(params["location"])
        end  
        if @survey.save 
            user.surveys << @survey            
            redirect "/surveys/#{@survey.id}"
        else 
            erb :"surveys/new"
        end 
    end 

    get '/surveys/:id' do 
        if logged_in?
            @survey = Survey.find_by_id(params[:id])
            erb :'/surveys/show'
        else 
            redirect '/'
        end 
    end

    get '/surveys/:id/edit' do 
        if logged_in?
            @survey = Survey.find_by_id(params[:id])
            if @survey.user == current_user 
                erb :'/surveys/edit'
            else 
                @notice = "You do not have permission to edit this survey."
                erb :"/surveys/show"
            end 
        else 
            redirect '/'
        end 
    end

    patch '/surveys/:id' do 
        #if logged_in?
        @survey = Survey.find_by_id(params[:id])
        #if current_user = @survey.user_id?
        location = Location.find_by(params["location"])
        if location 
            @survey.location= location 
        else 
            @survey.build_location(params["location"])
        end  
        if @survey.update(params["survey"])             
            redirect "/surveys/#{@survey.id}"
        else 
            erb :"surveys/edit"
        end 

        # if valid_input?
        #     @survey.update(params["survey"])
        #     location = Location.find_or_create_by(params["location"])
        #     location.surveys << @survey 
        #     redirect "/surveys/#{@survey.id}"
        # else 
        #     @notice = "Invalid input. Please try again."
        #     erb :"/surveys/edit"
        # end 
    end

    delete '/surveys/:id' do 
        @survey = Survey.find_by_id(params[:id])
                # if logged_in? and current_user = params[:user_id]
        if @survey.user == current_user 
            @survey.destroy
            redirect "/surveys"
        else 
            @notice = "You do not have permission to delete this survey."
            erb :"/surveys/show"
        end 

    end
end 