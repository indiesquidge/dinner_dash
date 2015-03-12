class UsersController < ApplicationController
  before_action :set_user, only: [:create, :read, :update, :destroy]
  before_filter :authorize

  def show
    @user = User.find(params[:id])
  end

  private

  def set_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def authorize
    if current_user.nil?
      redirect_to login_path, alert: "You must log in"
    end
  end
end
