class SurveysController < ApplicationController

    get '/surveys' do 
        @surveys = Survey.all 
        @user = User.find_by_id(session[:id])
        erb :"/surveys/index"
    end 

    get '/surveys/new' do 
        erb :"/surveys/new"
    end 

    post '/surveys' do 
        user = User.find_by_id(session[:id])
        survey = Survey.create(params["survey"])
        location = Location.create(params["location"])
        location.surveys << survey 
        user.surveys << survey
        
        redirect "/surveys/#{survey.id}"
    end 

    get '/surveys/:id' do 
        @survey = Survey.find_by_id(params[:id])
        erb :'/surveys/show'
    end

    get '/surveys/:id/edit' do 
        # add validation
        @survey = Survey.find_by_id(params[:id])
        if @survey.user == current_user 
            erb :'/surveys/edit'
        else 
            @notice = "You do not have permission to edit this survey."
            erb :"/surveys/show"
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
        @survey.destroy
        redirect "/surveys"
    end
end 