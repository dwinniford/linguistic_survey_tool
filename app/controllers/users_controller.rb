class UsersController < ApplicationController
   
   get "/users" do  # change to /users/:id after add db
    @name = session[:name]
    erb :"users/show"
   end 
end 