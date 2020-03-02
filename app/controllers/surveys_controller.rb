class SurveysController < ApplicationController

    get '/surveys' do 
        @surveys = Survey.all 
        @user = User.find_by_id(session[:id])
        erb :"/surveys/index"
    end 

    get '/surveys/new' do 
        erb :"/surveys/new"
    end 
end 