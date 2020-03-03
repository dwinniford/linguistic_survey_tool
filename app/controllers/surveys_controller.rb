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
        if logged_in?
            erb :"/surveys/new"
        else 
            redirect '/'
        end 
    end 

    post '/surveys' do 
        user = User.find_by_id(session[:id])
        if valid_input?
            survey = Survey.create(params["survey"])
            location = Location.create(params["location"])
            location.surveys << survey 
            user.surveys << survey            
            redirect "/surveys/#{survey.id}"
        else 
            @notice = "Invalid input. Please try again."
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
        @survey.update(params["survey"])
        @survey.location.update(params["location"])
        redirect "/surveys/#{@survey.id}"
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