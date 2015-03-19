class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if user_found_and_authenticated
      sign_in
    else
      flash[:error] = "Invalid email or password, try again"
      render :new
    end
  end

  def destroy
    sign_out
  end

  private

  def sign_in
    session[:user_id] = @user.id
    redirect_to menu_path, notice: "Sign in successful"
  end

  def user_found_and_authenticated
    @user && @user.authenticate(params[:session][:password])
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out"
  end
end
