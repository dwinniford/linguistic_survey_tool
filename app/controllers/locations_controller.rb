class LocationsController < ApplicationController
    get '/locations' do 
        # add validation
        @locations = Location.all 
        erb :"/locations/index"
    end

end 