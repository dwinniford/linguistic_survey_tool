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
        @survey.build_location
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
        @survey.build_location(params["location"]) #need something like find or build location. try uniqueness validation of conditional statement with find 
        # @location = Location.find_or_initialize_by(params["location"])  # refactor params to be one step? params["survey"]["location"]
        if @survey.save # only checks to validate suvey
            #&& @location.save # this doesn't work because if the first evaluates false the second will not be evaluated.  alse creates possibility of survey being persisted without a location
            location.surveys << survey 
            user.surveys << survey            
            redirect "/surveys/#{survey.id}"
        else 
            # @survey.location.valid?
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