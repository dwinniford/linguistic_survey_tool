class UsersController < ApplicationController
   get '/users/home' do 
        @user = current_user
        erb :'/users/home'
   end
end 

#create a show route for a user and on that page show me each of their survey names and location 