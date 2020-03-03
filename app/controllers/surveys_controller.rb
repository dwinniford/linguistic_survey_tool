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
        binding.pry
        redirect "/surveys/#{survey.id}"
    end 

    get '/surveys/:id' do 
        @survey = Survey.find_by_id(params[:id])
        erb :'/surveys/show'
    end

    get '/surveys/:id/edit' do 
        @survey = Survey.find_by_id(params[:id])
        erb :'/surveys/edit'
    end
end 