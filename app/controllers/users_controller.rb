class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index.html.erb" })
  end

  def path_username
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.first
    if @the_user == nil
      redirect_to ("/404")
    else
      render({ :template => "user_templates/path_username.html.erb" })
    end
  end

  def include_user
    newuser = User.new
    newuser.username = params.fetch("input_username")
    newuser.save
    redirect_to("/users/#{newuser.username}")
  end

  def edit_user
    edituser_id = params.fetch("update_userid")
    edituser_matching = User.where({ :id => edituser_id })

    edituser = edituser_matching.first
    edituser.username = params.fetch("input_username")
    edituser.save

    redirect_to("/users/#{edituser.username}")
  end
end
