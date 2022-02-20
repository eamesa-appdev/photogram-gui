class UsersController < ApplicationController
  def index
    matching_users =  User.all
    @list_of_users = matching_users.order({ :username => :asc})
    render({ :template => "user_templates/index.html.erb"})
  end
  
  def path_username
    
    url_username = params.fetch("path_username")
    
    matching_usernames = User.where({ :username => url_username})
    
    @the_user = matching_usernames.first
    if @the_user == nil
      redirect_to ("/404")
    else
      render({ :template => "user_templates/path_username.html.erb"})
  end
end
end