class SessionsController < ApplicationController
  def create
    session[:password] = params[:password]
    session[:user_name] = params[:user_name]
    flash[:notice] = "Successfully logged in"
    redirect_to home_path
  end

  def destroy
    reset_session
    flash[:notice] = "Successfully logged out"
    redirect_to login_path
  end
end