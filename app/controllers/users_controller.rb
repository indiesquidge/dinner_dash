class UsersController < ApplicationController
  before_filter :authorize

  private

  def authorize
    if current_user.nil?
      redirect_to login_path, alert: "You must log in"
    end
  end
end
