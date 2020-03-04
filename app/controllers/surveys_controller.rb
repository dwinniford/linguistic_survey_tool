class SurveysController < ApplicationController

    get '/surveys' do 
        if logged_in? 
            @surveys = Survey.all 
            @user = User.find_by_id(session[:id])
            erb :"/surveys/index"
        else
            redirect '/'
        end 
    end 

    get '/surveys/new' do 
        @survey = Survey.new 
        if logged_in?
            @locations = Location.all 
            erb :"/surveys/new"
        else 
            redirect '/'
        end 
    end 

    post '/surveys' do 
        user = User.find_by_id(session[:id])
        @survey = Survey.new(params["survey"])
        if @survey.save
            location = Location.find_or_create_by(params["location"])
            location.surveys << survey 
            user.surveys << survey            
            redirect "/surveys/#{survey.id}"
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
        # add validation
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
        @survey = Survey.find_by_id(params[:id])
        if valid_input?
            @survey.update(params["survey"])
            location = Location.find_or_create_by(params["location"])
            location.surveys << @survey 
            redirect "/surveys/#{@survey.id}"
        else 
            @notice = "Invalid input. Please try again."
            erb :"/surveys/edit"
        end 
    end

    delete '/surveys/:id' do 
        @survey = Survey.find_by_id(params[:id])
        if @survey.user == current_user 
            @survey.destroy
            redirect "/surveys"
        else 
            @notice = "You do not have permission to delete this survey."
            erb :"/surveys/show"
        end 

    end
end 