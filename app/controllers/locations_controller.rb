class LocationsController < ApplicationController
    get '/locations' do 
        if logged_in? 
            @locations = Location.all 
            erb :"/locations/index"
        else 
            redirect '/'
        end 
    end

end 