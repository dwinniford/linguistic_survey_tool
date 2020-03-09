# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database - users are stored at signup, location and survey are created and stored on the new survey form.
- [x] Include more than one model class (e.g. User, Post, Category) - includes User, Location, and Survey classes.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - User and Location both has many surveys.  
- [X] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Survey belongs to a Location and a User.
- [X] Include user accounts with unique login attribute (username or email) - Users create an account with a name that must be unique.
- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - surveys can be created, viewed, edited and deleted.
- [X] Ensure that users can't modify content created by other users - Users can only edit surveys that belong to them.
- [X] Include user input validations - the survey model validates user input
- [X] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - survey model uses ActiveRecord messages to display to user.
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message