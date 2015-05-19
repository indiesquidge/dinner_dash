class UsersController < ApplicationController

  def show
    if current_user.nil?
      redirect_to login_path, alert: "You must sign in"
    else
      @orders = Order.where(user_id: current_user.id)
    end
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in
    else
      redirect_to :back
      flash[:danger] = "Please fill in all fields."
    end
  end

  private

  def sign_in
    session[:user_id] = @user.id
    redirect_to account_path
    flash[:alert] = "You have successfully created an account."
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
