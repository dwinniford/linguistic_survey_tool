class UsersController < ApplicationController
   get "/users" do  # change to /users/:id after add db
    @user_name = session[:user_name]
    erb :"users/show"
   end 
end 