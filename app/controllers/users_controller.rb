class UsersController < ApplicationController

  def new
  end

  def update
    user = User.find_by(user_id: params['user_id'])
    user.main_account_id = params["account"]

    if user.main_account_id == nil
      redirect_to "/users/#{user.id}", alert: "You must select an account!"
    else
      user.save
      redirect_to "/users/#{user.id}", notice: "Main Account has been changed"
    end
  end

  def create
    user = User.new
    user.name = params['name']
    user.email = params['email']
    user.password = params['password']
    if user.has_required_fields?
      if user.verify_unique_email
        redirect_to "/users/new", alert: "#{user.email} is already registered!"

      else
        user.save
        redirect_to users_url, notice: "Thanks for signing up"
      end
    else
      redirect_to "/users/new", alert: "Please Complete the form!"
    end
  end

  def index
  end

  def show
    @user = User.find_by(id: params["id"])


    if @user != nil
      if session["user_id"] != @user.id
        redirect_to "/", alert: "Invalid page"
      end
    else
      redirect_to "/", alert: "Invalid page"
    end
  end


end
