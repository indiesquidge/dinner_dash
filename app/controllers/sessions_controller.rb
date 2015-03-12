class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to account_path, notice: "Login successful"
    else
      flash[:errors] = "Invalid login"
      render :new
    end
  end
end
