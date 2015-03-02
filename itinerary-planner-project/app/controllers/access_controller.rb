class AccessController < ApplicationController
  skip_before_action :confirm_logged_in, only: [:signup, :login, :create, :attempt_login]
  before_action :prevent_login_signup, only: [:signup, :login]

  def signup
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You are now logged in!"
      redirect_to itineraries_path(session[:user_id]) #(root_path) when user is created, redirect to all itineraries specific to user
    else
      render :signup
    end
  end

  def login
  end

  def attempt_login

    if params[:user_name].present? && params[:password].present?
      found_user = User.find_by_user_name params[:user_name]
      if found_user
        authorized_user = found_user.confirm params[:password]
      end
    end

    if !found_user
      flash.now[:alert] = "Invalid user_name"
      render :login

    elsif !authorized_user
      flash.now[:alert] = "Invalid password"
      render :login

    else
      session[:user_id] = authorized_user.id
      redirect_to itineraries_path, flash: {success: "You are now logged in."}
      # (root_path) probably going to break—when successfully logged in
      # this needs to route to itineraries page of the session user
    end

  end

  def home

  end


  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to login_path
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password, :password_digest, :first_name, :last_name, :email)
  end

  def prevent_login_signup
    if session[:user_id]
      redirect_to home_path
    end
  end
end
